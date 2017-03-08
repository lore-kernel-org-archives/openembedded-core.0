Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 663EA72F45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 20:18:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v28KI5C9008211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Mar 2017 12:18:05 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 12:18:04 -0800
To: <openembedded-core@lists.openembedded.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <1c486f2a-f437-477d-ee79-188c7aafb34e@windriver.com>
Date: Wed, 8 Mar 2017 14:18:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
Subject: gpgme -- yet another python issue...
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
X-List-Received-Date: Wed, 08 Mar 2017 20:18:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

I don't have a fix for this, but if I enable multilib processing I see two
additional issues.

Maybe someone else can spot how to fix this?

My config (add to local.conf)

# Uncomment the following lines to enable multilib builds
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"


MACHINE=qemux86-64 bitbake gpgme


What I get is:

WARNING: gpgme-1.8.0-r0 do_package: QA Issue: gpgme: Files/directories were
installed but not shipped in any package:
  /usr/lib/python3.5/site-packages/gpg-1.8.0-py3.5.egg-info
  /usr/lib/python3.5/site-packages/gpg/_gpgme.cpython-35m-x86_64-linux-gnu.so
  /usr/lib/python3.5/site-packages/gpg/version.py
  /usr/lib/python3.5/site-packages/gpg/callbacks.py
  /usr/lib/python3.5/site-packages/gpg/core.py
  /usr/lib/python3.5/site-packages/gpg/errors.py
  /usr/lib/python3.5/site-packages/gpg/__init__.py
  /usr/lib/python3.5/site-packages/gpg/results.py
...
  /usr/lib/python3.5/site-packages/gpg/__pycache__/results.cpython-35.pyc
  /usr/lib/python3.5/site-packages/gpg/__pycache__/util.cpython-35.pyc
  /usr/lib/python3.5/site-packages/gpg/__pycache__/gpgme.cpython-35.pyc
Please set FILES such that these items are packaged. Alternatively if they are
unneeded, avoid installing them or delete them within do_install.
gpgme: 59 installed and not shipped files. [installed-vs-shipped]


So two problems:

1) When multilibs are enabled the path is incorrect.  The gpgme is using:
PYTHON_SITEPACKAGES_DIR

but this is pointing to /usr/lib64/python3.5, but the files installed into
/usr/lib/python3.5.. (presumably due to a bug in gpgme's makefiles..)

2) Why are the __pycache__ files being generated, I did not see this behavior on
other (non-x86) architectures.  So we may have some kind of contamination problem.


(I likely will not have time to fix these before next week, so if someone else
can figure this out please give it a try!)

--Mark

