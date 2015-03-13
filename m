Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5516013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:26 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so104888976iec.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=yf1FpDa2MmPsbst4FhmyrEwgS3YPRJKdFbaxkhx4SgM=;
	b=RUiZL/JOwhdbPw3ZeQaMBl4/3tnBualN+hapXbRF/ypSMe1pa11HHEXIsD8ZJvqSyG
	+gwGU5qNvkCc34Oy/c+6ErozjfF7u/cLnOoXV1dg9ru9egSecGewLVTgMdqBESGXJp5F
	D3md9GxG2/UnYtomV2hKcPVLFufx8ZODgH34ysK0eKxDG9qjl9bi4SRcC3mC/q8XelCt
	CM38/DQBEFt1hy6ry1QFhYwbDbQ5fssUR1EjRIhe2Z5W90zwUvKkimYCX8olToWEObH+
	hXc4v345Da+OAiBC0QLmJsi0bF9PbxP+mvfFXkl8H/zfhmhZoBy/RDRlStvFvLVrA5kK
	hlLA==
X-Gm-Message-State: ALoCoQl8yRWMORHqaCHGHsbkZdc+hwdBo7awNVxJzzHXDcIryQDHnd51yKNJvFXc/9+YqKaqfey6
X-Received: by 10.50.66.170 with SMTP id g10mr109911105igt.49.1426253423575;
	Fri, 13 Mar 2015 06:30:23 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:37 +0100
Message-Id: <ad0479212e364f296f7dca3708317baa64ef1602.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 08/11] combo-layer: partial import for '--history init'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 13:30:26 -0000

The new "since_revision" property can be used to cut off the imported
history at some point. This is useful to keep the resulting repository
smaller while still preserving enough history that "git annotate"
reports the right author and commit for most lines.

The initial, squashed import commit shows up with "unknown" as author
in the "git annotate" output. It has the repository name as prefix
in the subject line; importing that commit works best with a
layer hook which does not add the repository name again when
it is already present. Adding it here is useful for hooks
which do not extend the subject line.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer              | 40 ++++++++++++++++++++++++++++++++++++++++
 scripts/combo-layer.conf.example | 13 +++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 6d24ce3..cbff618 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -284,6 +284,46 @@ def action_init(conf, args):
                 runcmd("git branch -D %s" % refname, ldir)
                 # Make that the head revision.
                 runcmd("git checkout -b %s %s" % (name, initialrev))
+                # Optional: cut the history by replacing the given
+                # start point(s) with commits providing the same
+                # content (aka tree), but with commit information that
+                # makes it clear that this is an artifically created
+                # commit and nothing the original authors had anything
+                # to do with.
+                since_rev = repo.get('since_revision', '')
+                if since_rev:
+                    committer = runcmd('git var GIT_AUTHOR_IDENT').strip()
+                    # Same time stamp, no name.
+                    author = re.sub('.* (\d+ [+-]\d+)', r'unknown <unknown> \1', committer)
+                    logger.info('author %s' % author)
+                    for rev in since_rev.split():
+                        # Resolve in component repo...
+                        rev = runcmd('git log --oneline --no-abbrev-commit -n1 %s' % rev, ldir).split()[0]
+                        # ... and then get the tree in current
+                        # one. The commit should be in both repos with
+                        # the same tree, but better check here.
+                        tree = runcmd('git show -s --pretty=format:%%T %s' % rev).strip()
+                        with tempfile.NamedTemporaryFile() as editor:
+                            editor.write('''cat >$1 <<EOF
+tree %s
+author %s
+committer %s
+
+%s: squashed import of component
+
+This commit copies the entire set of files as found in
+%s %s
+
+For more information about previous commits, see the
+upstream repository.
+
+Commit created by combo-layer.
+EOF
+''' % (tree, author, committer, name, name, since_rev))
+                            editor.flush()
+                            os.environ['GIT_EDITOR'] = 'sh %s' % editor.name
+                            runcmd('git replace --edit %s' % rev)
+
                 # Optional: rewrite history to change commit messages or to move files.
                 if 'hook' in repo or dest_dir and dest_dir != ".":
                     filter_branch = ['git', 'filter-branch', '--force']
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 38bc53c..90e2b58 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -63,11 +63,24 @@ last_revision =
 # example:
 #     hook = combo-layer-hook-default.sh
 
+# since_revision:
+#   since_revision = release-1-2
+#   since_revision = 12345 abcdf
+#
+# If provided, truncate imported history during "combo-layer --history
+# init" at the specified revision(s).  More than one can be specified
+# to cut off multiple component branches.
+#
+# The specified commits themselves do not get imported. Instead, an
+# artificial commit with "unknown" author is created with a content
+# that matches the original commit.
+
 [oe-core]
 src_uri = git://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
+since_revision = some-tag-or-commit-on-master-branch
 
 # It is also possible to embed python code in the config values. Similar
 # to bitbake it considers every value starting with @ to be a python
-- 
2.1.4


