Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EB7A277240
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 21:20:08 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o64so2413464pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 13:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IMHy/C+8NDFWPp4gWV0ZPiSJTEIg10TOjwDliEcWp6g=;
	b=NVlAHbM13BoSyuHi6Ds06XDqF/VFm/jg64JuGkbQeQsL5nHGCSFlhSIaJJW3J2erUH
	w7zNfEgYUT7fiqzBmWg5ZcSAK3YkAEjLqfJayQ+uX51wZixaiDAQWv2g8SyR0v1nCu5g
	BuJdhHoWtPaMfdpQu9nzmxA2c2aLgr4WoheCSfVV3p0sT6rMfm+Ml1PLFW/nM2RmQWpP
	/Z4anENxBlqkz3wkdJs9DpcPymXsjAJRxnYpjKRBRy8wNqbZZBEZGWCrxOo1t5PkGoup
	aJk/zQGv7BME+VFfS5qJUULoREfgx0Q324CDr/8NQcENbKvES3j4ogfrrqTCxL03hiHZ
	Ezyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IMHy/C+8NDFWPp4gWV0ZPiSJTEIg10TOjwDliEcWp6g=;
	b=L2RqJi4wZ4IYGPZW+5CcodEvEFYnH/Vc9e8EUXljPCvQHbP+9f122KLmknJ6ydSfWS
	7sCy8daPdr9zPnftuvF9W0l/em2MaOnAnw9fVQfLXe9gflkEWY3tvrrAWS8xOrHcRVeR
	YkSOasMsc9gF9AlVhDe/8STDYQubTJG+fISUwksGSicWCEb8tb3WDvwCpCrCRDCIhvuj
	3wDT2ZSCP6zgu9TmVInh6PUjyL85ALR9DjPv25RjflJKnltmro+dYwanyqlkDCquryVz
	SWb57VfTSJ2LCFWOAMxUY9tf6+looMpQkKtgd5vokZ+jou1gCM6y520g32qMzOICCRw/
	vtRQ==
X-Gm-Message-State: AMke39kv6CaGzHW93VB+0hFa9aRQL72E5fhYF6C0PIH+5f3GYqzDgTzDoyzINxdrVbFa+Q==
X-Received: by 10.84.140.36 with SMTP id 33mr5454579pls.136.1487280008776;
	Thu, 16 Feb 2017 13:20:08 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c18sm15327402pfj.49.2017.02.16.13.20.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 13:20:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 13:19:57 -0800
Message-Id: <20170216211957.23670-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH V2] qemu-native: Point python to python2 on build host
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
X-List-Received-Date: Thu, 16 Feb 2017 21:20:09 -0000

On buildhosts where default python has switched to using python3
qemu-native fails configure like this

| ERROR: Cannot use 'python', Python 2.6 or later is required.
|        Note that Python 3 or later is not yet supported.
|        Use --python=/path/to/python to specify a supported Python.
|

we still expect build host to have python2 pre-installed
and is always available.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ef5d75c450..cdbb7f1671 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,7 @@ SRC_URI_append_class-native = "\
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
+EXTRA_OECONF_append_class-native = " --python=${USRBINPATH}/python2"
 
 EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
-- 
2.11.1


