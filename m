Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF2960697
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 19:14:30 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id f2so882738pjq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 11:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qdBLqomA092ZFeZSQrPO+O3+KN1q9YfBj6oEdD4vPy4=;
	b=UYl7sOZ36Ufu89ogap2tw3c7xTeEtq19jefnOAUvlVFkN47MPzOGGZLSUZz7UxCQJH
	kywd3rsjwAnzk1aN+2/arZfgbMHdAhV/o2A1JZdkIaYawBcQSBu+N2qujfC+Ga1/GPYJ
	6xi7HEfuKgl4csNXm7M5CkHWw1pnZ93/fpM50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qdBLqomA092ZFeZSQrPO+O3+KN1q9YfBj6oEdD4vPy4=;
	b=uGdRVEuBMU5Kr2j4HZbm62IKJMxBXbY5iNcoo+RiYm1loCmdquxVgrtb5sfJSBO3d3
	+srKzi832u4Pgt60/55dMQJFIgO1YqvjGDVcVSnesJD5/Bdk8D5kSRebNXoYCuH1n+o9
	GkbhR0NT4srD51cUVmTloQREk/ZVLku2WHe4agkS97IiQu6gy1wGVD5oCq6ADcfEVmiG
	lxne+9kWAoK1Ekca6YHYRmm3pDY6E1sNrVaNqPIiP2WHeuTT29m43MGuhnvFrmsyOy+a
	vmXrmg59PzoEyeVKBELIppUAUAQgP6BBwb/JXoFK88YQ0gmLHNKJUp4zbF1VwtWdL5WH
	BM/Q==
X-Gm-Message-State: APjAAAVCD9frt1/wtSuWwi0tELyZ9KtlO+O8MlxAQWoG46V6Ebp2QdUU
	a+Dx60t1UU46Q3J3VZSrJIBFD5uWqNNi866rk0qahMuu41J9uIdwcOkd7wNxTsb+sFgPWTZwdEa
	7wuuJE4lz2IO3xoXSiV0LmmCXY3lAkh5guXqHd8bOdZjtCZdy5x4p/ivKHH6JDZcB0Z1Cfzj++q
	aWg1nxK+O6SU2dIW5onj2NEIIAZZ0=
X-Google-Smtp-Source: APXvYqyiVgDYEJSppIyG0TKJhvfl0epn+lQOnAqgj9+i2OOhgbIPg/nAHuiAUKKf5cvFNON8OsdRrQ==
X-Received: by 2002:a17:90a:5d97:: with SMTP id
	t23mr4380704pji.61.1582053270889; 
	Tue, 18 Feb 2020 11:14:30 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	k29sm5232909pfh.77.2020.02.18.11.14.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 11:14:30 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 11:14:22 -0800
Message-Id: <20200218191422.8359-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Lori Hikichi <lori.hikichi@broadcom.com>
Subject: [PATCH] rpm2cpio.sh: fix to handle newline character
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
X-List-Received-Date: Tue, 18 Feb 2020 19:14:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lori Hikichi <lori.hikichi@broadcom.com>

This script is attempting to read binary data from an rpm file.
If any of the bytes it is attempt to read is the binary value 0xa
(i.e. a newline) then the script does not properly deal with this
special case. Due to the behavior of command substitution, instead of
fetching the value 0xa, the script makes an error and get the value 0
instead.

The fix and the following explantion was taken from this post...

https://unix.stackexchange.com/questions/10801/
how-to-use-bash-script-to-read-binary-file-content

Command substitution $(…) strips final newlines in the command output.
There's a fairly easy workaround.  Make sure the output ends in a
character other than a newline, then strip that one character.

Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 scripts/rpm2cpio.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index 876c53c5d9..7cd771bbe7 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -22,7 +22,8 @@ calcsize() {
 
 	i=0
 	while [ $i -lt 8 ]; do
-		b="$(_dd $(($offset + $i)) bs=1 count=1)"
+ 		b=$(_dd $(($offset + $i)) bs=1 count=1; echo X)
+ 		b=${b%X}
 		[ -z "$b" ] &&
 			b="0" ||
 			b="$(exec printf '%u\n' "'$b")"
-- 
2.17.1


