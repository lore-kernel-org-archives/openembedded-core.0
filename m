Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4E972D78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:19 +0000 (UTC)
Received: by igkb16 with SMTP id b16so856765igk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0yRAf+l1/guzmU/gVsc4MAV7sfDT8SkhBvNezDZ2HEA=;
	b=J5MufW7YJCvpzfSRHygdLXtFfgOdGzU2AE/lqoLuavf0O3PlWxaDxyh4BPiqpR9zX6
	zx7XwoI3NFYr5/8GG68353axvDa3F8/RuGR82vuXNDJoAwKM19KkYLDpXzKRawNGnvhW
	IggbSU0lBle0nVVVQT+jAtlBJOfGkfs2ntcBw3zjp/zY65gPI4w1ytoWCohJZBaVSm+1
	OWd33mbvsqwgLdPHFK3datGUIOx0wMC2EO6szjp1AC4wbY6ef+b3Optj+mXG5YPryqfu
	p3W2PP8WQmh/QmZkUvJjgiObQh1Tyrgu1kJXlvJ8JgiKMkNLPsmwrtLiIz8GfhsU4Get
	Eesw==
X-Gm-Message-State: ALoCoQm3yr/MOgRmSExbhpJyvLPyVjehPktyTTearRPnDLQL87RW1dJdTI218aHlQabAW5i08RUJ
X-Received: by 10.107.19.204 with SMTP id 73mr61896393iot.83.1426253420832;
	Fri, 13 Mar 2015 06:30:20 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:20 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:36 +0100
Message-Id: <e629284e4c7ba2db8355f61a4d9c8d77a6432113.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 07/11] combo-layer: combine trees via replacement objects
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:20 -0000

Instead of local graft entries rooting the imported branches in the
shared root commit, use replacement objects.

The advantage is that they get moved around by "git push" and "git
fetch", so everyone has the same, nicer view with everything starting
at the beginning of the combined repository.

If undesired, these objects can be removed with "git replace".

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index d11274e..6d24ce3 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -354,14 +354,14 @@ file_exclude = %s''' % (name, file_filter or '<empty>', repo.get('file_exclude',
             # Create Octopus merge commit according to http://stackoverflow.com/questions/10874149/git-octopus-merge-with-unrelated-repositoies
             runcmd('git checkout master')
             merge = ['git', 'merge', '--no-commit']
-            with open('.git/info/grafts', 'w') as grafts:
-                grafts.write('%s\n' % startrev)
-                for name in conf.repos:
-                    repo = conf.repos[name]
-                    # Use branch created earlier.
-                    merge.append(name)
-                    for start in runcmd('git log --pretty=format:%%H --max-parents=0 %s' % name).split('\n'):
-                        grafts.write('%s %s\n' % (start, startrev))
+            for name in conf.repos:
+                repo = conf.repos[name]
+                # Use branch created earlier.
+                merge.append(name)
+                # Root all commits which have no parent in the common
+                # ancestor in the new repository.
+                for start in runcmd('git log --pretty=format:%%H --max-parents=0 %s' % name).split('\n'):
+                    runcmd('git replace --graft %s %s' % (start, startrev))
             try:
                 runcmd(merge)
             except Exception, error:
-- 
2.1.4


