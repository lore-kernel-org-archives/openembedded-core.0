Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHydx-0004aV-Vj
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:35:34 +0200
Received: by wera1 with SMTP id a1so603312wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=AjCDQ1wCH6+sC/k4b+10/htdpzE8naQHUHisPsP8QXw=;
	b=iIY305RLqIbN9Zymshe252eDqZc+3BO66SRZXqkruHRItuouSKZNmhR7Gh96SUc3gK
	CuCauAT4F6GGlXBXBum6uVrou2hlEFAFGqo/Wzjy1DOWeb0XRRAmMMEbqLS+Ynm0Jezh
	WpvsXp0jTueBz21Cp607Wgcv8BxqCE0blzpgUaNRJGOTdflTxoPrfoTEKwcHIZJYjXi6
	C3EpOyG0vxNQmrw9KCm7R5JI+d9q60pBUsJHvYBizyJD9a1BWng3tV3GVJMapLgp2F/5
	frsXOVZxGPZbQRTFMVo4vTWxs2t6Sfqj7VmUchTKfUHzxb4xFSXSDvlx54L8B/dK9yg2
	SE5w==
Received: by 10.180.79.72 with SMTP id h8mr7212704wix.1.1334154373824;
	Wed, 11 Apr 2012 07:26:13 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id k6sm45256361wie.9.2012.04.11.07.26.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:26:13 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:26:07 +0300
Message-Id: <cover.1334154247.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmB1ncagN9sRRqz5wpSraWkni2wngQ0vKv/9DWSClCShXNrK9NX174NPcOQh6vztkFMqns0
Subject: [PATCH 0/3] Bug 2134 - bitbake package-index fails for rpm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 14:35:34 -0000

The bug is that the native python used to run genpkgmetadata.py is picking up
host's python modules.

More about this. RPM is built without python. And this modules is needed by the
above py file.

So: 
1. rpm-native should be built with python support.
2. native python should only look into STAGING_DIR_NATIVE directory for
modules.
3. createrepo scripts should use native python


The following changes since commit 190f6d791d51aaa4cfb9f1cf932bc205ff674fb5:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:47 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/package-index
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/package-index

Andrei Gherzan (3):
  createrepo: Python scripts should use the python interpreter from env
  package-index: Force NATIVE python to use modules from
    STAGING_DIR_NATIVE
  rpm-native: Compile python rpm module (with-python)

 meta/recipes-core/meta/package-index.bb            |    3 +
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 -
 ...n-scripts-should-use-interpreter-from-env.patch |   47 ++++++++++++++++++++
 .../createrepo/createrepo_0.4.11.bb                |    3 +-
 4 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch

-- 
1.7.5.4



