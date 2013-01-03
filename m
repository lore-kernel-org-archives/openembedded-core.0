Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlN-0000dB-AS
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f45.google.com with SMTP id ep20so8652884lab.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer;
	bh=sKtGpBJ8jKCoWnqQYUTHjOdLpxfCQXyeCuM1XXXbIdQ=;
	b=nGPTrykkVs7zOu+lKm+zqIFJAr2Ena7BZLThckkc0fxfJY/ZCicgH0brG/CpGIV0/o
	vUuuIve+WeCDShO8e8gQK9WabsopYoKHWq1iIVBuWAwJfNzZrEol+g7j5wGWBmia6X/C
	+JtXIbkbtBkG4ls/XfUm1CQ0enrxPwDk5Q4QJnRhqyCM3vEpXF+OcrDAf7xThacAVOup
	EsTY4sEvkNyHrG/k2eDOcmWoGQacC2jwOlsRL14OswpXVuBVUWr6SCFLaSjUumLgkDy7
	OFX/bRkUvVDoadNX+xJh5mDdU7MCW5JkYrHimrVEqlcIHOsEPKM55znplEUZe/sPXl0R
	v+Vg==
X-Received: by 10.152.147.103 with SMTP id tj7mr48498009lab.54.1357245397017; 
	Thu, 03 Jan 2013 12:36:37 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id u5sm17334161lbm.8.2013.01.03.12.36.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:35 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>) id 1TqrWj-0002C7-En
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 22:36:33 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:16 +0200
Message-Id: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: Prepare recipes for automake-1.13 (batch 1)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

In practice there is three categories of changes in automake-1.13
that cause packages to break. From that follows that virtually all
problems fall to three categories, and all packages suffering from
problem of the same category get virtually identical fix.

* Long deprecated macros completely removed from automake-1.13,
  which errors out upon seeing them. For these I add patch,
  always called obsolete_automake_macros.patch, that replaces
  obsolete macro with proper one. Most of the patches are just
  AM_CONFIG_HEADER -> AC_CONFIG_HEADERS change.

* Trying to run help2man via "missing" when it doesn't exist.
  Old automake versions allowed "missing" to be used that way,
  1.13 aborts. I'm just removing the attempt to create manpages
  that way. Note that it never actually worked anyway -
  old automake just didn't abort when it failed.

* TESTS list cannot have $(srcdir) or $(top_srcdir) as part
  of the path. When it does, it's usually bug in the package,
  but unfortunately automake prevents it also when it's not.
  Solution applied here is to simply remove TESTS.


[PATCH 01/15] pkg-config: replace obsolete automake macros with
[PATCH 02/15] libtool: remove help2man dependency
[PATCH 03/15] bison: remove help2man dependency
[PATCH 04/15] file: replace obsolete automake macros with working
[PATCH 05/15] popt: disable tests
[PATCH 06/15] glib-2.0: replace obsolete automake macros with
[PATCH 07/15] libx11: disable tests
[PATCH 08/15] libpng: replace obsolete automake macros with working
[PATCH 09/15] libusb: replace obsolete automake macros with working
[PATCH 10/15] pixman: replace obsolete automake macros with working
[PATCH 11/15] libid3tag: replace obsolete automake macros with
[PATCH 12/15] libgcrypt: replace obsolete automake macros with
[PATCH 13/15] gnutls: replace obsolete automake macros with working
[PATCH 14/15] libtasn1: remove help2man dependency
[PATCH 15/15] flac: replace obsolete automake macros with working


