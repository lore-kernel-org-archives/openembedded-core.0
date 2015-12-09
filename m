Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id C7F8D6FF77
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 18:14:26 +0000 (UTC)
Received: by igcto18 with SMTP id to18so46425262igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 10:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hh1MkBVCupYh5+YYSQV9zNVE+/fO5OUK7pP7ywnTz3M=;
	b=pYxK4tUAcqYSDcnFJS89rwhmWJqlpIkEKnGxqndbdyFSkaAOGwFoKJjSwayTCB7Ndm
	J1sjA8opH0hbhzHmmM+Lr5qk67x2Z6nlHgJr8sZAu4dMMsiyIuK18GExtqwC4dsm5Yme
	SC+ZUQEuKlamwp47ihqKAzj7k2GzLx/yPMdAcsL1P50ZdtmW5+7qpA3yx6caVAfsR2QQ
	Xfp+I4ZrRkULuUAW6SP9tkSQiJ7No2/c7ywlQLE3saSIarQhMZmp6srE82gtuZ6FmVw2
	VFEFZ3a5oYDP0RgUt5eF831YHyaLJQ04k8ny7eRo3EOX+Q3bmFQcueI+kdR3cD0WX/h6
	EcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hh1MkBVCupYh5+YYSQV9zNVE+/fO5OUK7pP7ywnTz3M=;
	b=TcPEg95QkFQAP1B+eMwFrhuBmQ1L6QvAhwoD1Y2WEBHiCOG7JZqaIVHeeqbVG3oOLb
	ihlPy8pdJFh0ZthqbTecOi+LTVuWPJy7hG8OKrqLZsAUKAAxPk//mjaTj3/bs6o381yU
	+1GcTbL9Ern7DOfsOoncCRw5+QgjYay5rmM+r8Jok/0Gj/XiYM916R2n2t3NnYy4YFoT
	Vrpm76fcPmV6M12HhklefZhcE7ob5r6HgKhXtQJy4iJr87T/dl4h22lB6lyip5hSMwHZ
	r8QET7Rq6kMdDbAmbdnkSAydDtbNVYOK3ctuKiHGXXuXr3B9NGqzs2GMLAtq2HKyyD/n
	O6qg==
X-Gm-Message-State: ALoCoQmve65aN0sApmk0AubSs5O9Dvtlm0a+t0UEdLolZzBFL+NwecAPjZSJf3r8dozMIKf6Gp64GpXoYxFc+rcBdLSbrRXdkw==
X-Received: by 10.50.157.7 with SMTP id wi7mr10243822igb.63.1449684866865;
	Wed, 09 Dec 2015 10:14:26 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A560AC.dip0.t-ipconnect.de.
	[87.165.96.172])
	by smtp.gmail.com with ESMTPSA id 79sm3710213ioh.19.2015.12.09.10.14.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 10:14:25 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 20:14:28 +0100
Message-Id: <cover.1449683756.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] replace suid with capabilities, for example in busybox
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
X-List-Received-Date: Wed, 09 Dec 2015 18:14:29 -0000

I started working on hardening a distro by replacing suid binaries
with executables that add only the necessary capabilities via file
capabilities.  It is understood that this is often still a path
towards privilege escalation (see
https://forums.grsecurity.net/viewtopic.php?f=7&t=2522&sid=c6fbcf62fd5d3472562540a7e608ce4e#p10271)
but as part of a defense-in-depth strategy it's still useful.

I'd like to get the first two patches reviewed and, if seen as useful,
merged into master.

The busybox_%.bbappend is just an example how this would be used. It's
not meant to be merged.

There's currently one caveat: the file capabilities do not get copied
into images. I see them under pseudo (with getcap, filecap and as
security.capability xattr with getfattr), but they do not get copied
into an ext4 image by mkfs.ext4.

Robert, I tried that with the patched e2fsprogs from meta-selinux. Is
that perhaps something you can look into as part of
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8622 ?

Actually, I just noticed another problem with that e2fsprogs version:
with Smack enabled via meta-intel-iot-security/meta-security-smack,
/etc has under pseudo:
  # getfattr -d -m . rootfs/etc/
  # file: ../rootfs/etc/
  security.SMACK64="System::Shared"
  security.SMACK64TRANSMUTE="TRUE"

A loop-mounted ext4 image only has one xattr:
  security.SMACK64TRANSMUTE="TRUE"

The following changes since commit 192da885e92d3b163b9c4e6b8151c9ecc6062b14:

  build-appliance-image: Update to master head revision (2015-12-09 08:49:13 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core capabilities
  https://github.com/pohly/openembedded-core/tree/capabilities

Patrick Ohly (3):
  capabilities.bbclass: add file capabilities automatically
  busybox.inc: prepare for additional link files
  busybox_%.bbappend: run ping and traceroute with file capabilities

 meta/classes/capabilities.bbclass            | 58 ++++++++++++++++++++++++++++
 meta/recipes-core/busybox/busybox.inc        | 16 ++++----
 meta/recipes-core/busybox/busybox_%.bbappend | 41 ++++++++++++++++++++
 3 files changed, 108 insertions(+), 7 deletions(-)
 create mode 100644 meta/classes/capabilities.bbclass
 create mode 100644 meta/recipes-core/busybox/busybox_%.bbappend

-- 
2.1.4


