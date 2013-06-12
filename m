Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id BE2906A9E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:53:06 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id e11so3051514wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=MvrDKVL5960bEqv+Gkz08MQpWGrW0BvYJSQkopFJOKg=;
	b=WdkXPdbZejL5yd34L2XlT2OFVSDDreDCmUMJy1KIgJpXkhtc4LJBq4eSU7eOMrbUDA
	vp48rrdGoBXgOGbgp5TjybN338jRckZ1OSW+/g+9m/ahcFQ+k0eJ/zlz8vtaoRHffeVp
	TddrtxC50VaWqnqbyRWKz9whLt3noPYXt8MBUcGYhQH99Qw4ACvcUxVJvoxLnxC0KZr7
	SRlQH+s8/CHPBzI4rwTkeg2//XLOE7H3ap1VU0Rj/qITKnyfbcGfAjaaMefUjae522+b
	9CkPlXQpRXAtuEmDvD1bqeTkGpYGUnG8ec2JUhDWbqw/u69CjjPprb+zeTH7LrZ+mBIn
	lRTA==
X-Received: by 10.180.105.231 with SMTP id gp7mr5041850wib.23.1371055987094;
	Wed, 12 Jun 2013 09:53:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm4624419wij.5.2013.06.12.09.53.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 09:53:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 17:49:38 +0100
Message-Id: <cover.1371055550.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQklbjIFX13tsafgePL6rnWMW3hVP94IBmoJnSxoczyYjDLBsh/WIuqzJv8C2Q7/RHJ53GgW
Subject: [PATCH 0/4] Don't use create_wrapper to short-circuit interpretters
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
X-List-Received-Date: Wed, 12 Jun 2013 16:53:07 -0000

Hi,

create_wrapper was previously abused to invoke the Python/Perl interpretters
directly instead of relying on #! parsing, which is read into a 128 byte buffer
so breaks with deep build directories.

The new create_wrapper is stricter about it's input so this trick doesn't work
anymore.  Luckily there's already a "nativeperl" binary in the sysroot's
/usr/bin, so by adding a "nativepython" alongside it[1] recipes that used
create_wrapper can be changed to munge the #! line to e.g. /usr/bin/env
nativeperl.

(this series obsoletes 3 of the patches that Saul sent earlier involve
create_wrapper)

Ross

[1] The existing nativeperl is a wrapper, the new nativepython is a
symlink. Both seem to work and I can't see a good reason for a wrapper instead
of a relative symlink.

The following changes since commit b87429fdb45f82ebe4060fea8c4ecd6e4bc1ae52:

  bitbake: Add missing file that went out of sync (2013-06-12 13:13:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/wrap

for you to fetch changes up to 8237763ebcc3cfe4388690056a7c0fed8d65a6c2:

  gnome-doc-utils: drop the usage of create_wrapper (2013-06-12 17:44:39 +0100)

----------------------------------------------------------------
Ross Burton (4):
      dpkg: drop the usage of create_wrapper
      python-native: add nativepython symlink
      createrepo: drop the usage of create_wrapper
      gnome-doc-utils: drop the usage of create_wrapper

 meta/recipes-devtools/dpkg/dpkg.inc                  |   10 +---------
 meta/recipes-devtools/python/python-native_2.7.3.bb  |    6 ++++++
 meta/recipes-gnome/gnome/gnome-doc-utils.inc         |    2 +-
 meta/recipes-support/createrepo/createrepo_0.4.11.bb |    2 +-
 4 files changed, 9 insertions(+), 11 deletions(-)

Ross Burton (4):
  dpkg: drop the usage of create_wrapper
  python-native: add nativepython symlink
  createrepo: drop the usage of create_wrapper
  gnome-doc-utils: drop the usage of create_wrapper

 meta/recipes-devtools/dpkg/dpkg.inc                  |   10 +---------
 meta/recipes-devtools/python/python-native_2.7.3.bb  |    6 ++++++
 meta/recipes-gnome/gnome/gnome-doc-utils.inc         |    2 +-
 meta/recipes-support/createrepo/createrepo_0.4.11.bb |    2 +-
 4 files changed, 9 insertions(+), 11 deletions(-)

-- 
1.7.10.4


