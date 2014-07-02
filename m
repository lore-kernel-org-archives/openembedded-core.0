Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id B6D6E65E38
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 01:58:55 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id f73so6451664yha.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 18:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=misUdKwhRpbIOUm3F956xCy2wJZIRHHORc/TdjIuoYk=;
	b=lCC83r7HQuN1YByo/FvSsDKwBL7GrlO8xqVdvaKfgQuZr5zCDKfgtAzEyiX8ansRKl
	cvWt4XEyaVsnS+KosF4OhZU3DIG6/o1EXl6OIRQY+//kNG50vzNeVKT+DeCFSDg7zUBZ
	J+FWdlDEUvtyXzxa0ICf0hxDwpHd+LAkgqHfWe+ns6SLFj7A2ZciAB0oZCfPFKdWo/kC
	q0/+SBBjrFnUIUMysycFBesNRutqnJzCJISZv8fsZKe0XQUGosZoqKMSptfmhzwA2ZeH
	/dIaFZWZb3lhgJPvefQpKJ3usymD3B22/HvKVv7ImjArcIDz83GILPwzjPHDTGYQqYrH
	axwA==
X-Received: by 10.236.7.200 with SMTP id 48mr74632619yhp.43.1404266336571;
	Tue, 01 Jul 2014 18:58:56 -0700 (PDT)
Received: from localhost.localdomain ([201.53.220.248])
	by mx.google.com with ESMTPSA id
	d71sm28106373yho.24.2014.07.01.18.58.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Jul 2014 18:58:56 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 22:58:46 -0300
Message-Id: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/2] add nativesdk to BBCLASSEXTEND to python-distribute and to fix the side effect of it.
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
X-List-Received-Date: Wed, 02 Jul 2014 01:58:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, 

My company has a private python build tool that has python-distribute as dependency.
That tool builds well with -native. And now I need to put the my private tool in toolchain. So
my users could use it.

To accomplish, I added nativesdk to BBCLASSEXTEND. My buildtools-mytool recipe builds and the
toolchain get created. But when I try to install the toolchain I get the this:

$ tmp/deploy/sdk/buildtools-mytool-x86_64-nativesdk-standalone-1.6.1.0.sh 
Enter target directory for SDK (default: /opt/mydistro/mytool/1.6.1.0): 
You are about to install the SDK to "/opt/mydistro/mytool/1.6.1.0". Proceed[Y/n]?
Extracting SDK...done
Setting it up.../opt/mydistro/mytool/1.6.1.0/relocate_sdk.sh: linha 2: erro de sintaxe próximo do `token' não esperado `('

One of the files that relocate_sdk.sh was trying to handle is:

/opt/mydistro/mytool/1.6.1.0/sysroots/x
86_64-linuxsdk-linux/usr/lib/python2.7/site-packages/distribute-0.6.32-py2.7.egg/setuptools/script template (dev).py

Maybe there are other recipes when adding nativesdk to BBCLASSEXTEND which this special handler is needed. So it's better 
ensure the correct handler of file name with spaces characters.

João Henrique Ferreira de Freitas (2):
  python-distribute: add nativesdk to BBCLASSEXTEND
  populate_sdk_base: ensure that filenames with empty space character
    are handled

 meta/classes/populate_sdk_base.bbclass                   | 4 ++--
 meta/recipes-devtools/python/python-distribute_0.6.32.bb | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.9.1


