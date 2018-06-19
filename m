Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5A088754B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 10:51:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r15-v6so19113301wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CjKJj2zdPVg23JeuEIDVOFu9cesugcbbebCE8AQ9Tro=;
	b=Vpgg7V47SJUYihYBTA3ipUgUYL5jl0yk/LT+qzQaeap+bjp4JnvpQ+WjUIm8Y5Pngz
	Vpg+I+rZCbZFGrNdXVmZ+CtcJOjdwTz9ugWIUUfMJbgfvvhejV7IeK3qXNR3aY2vKubq
	6kUWo9TxnXSnlFQXTKl4gitRluAP+XbU3BujU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CjKJj2zdPVg23JeuEIDVOFu9cesugcbbebCE8AQ9Tro=;
	b=ZHPWQtlCDy0tTlQCI7LlSm2he6W08DsnaFuIZMTm7zTX3UGQHIMwzMYls68n1zpFYm
	IcRNeFkB7OAS77qdRfOW80+3Ia2O+skK9TiuTcHFN1twCcC8orU06gPlrUuJjYLnT5Xf
	ieaK7wCll1cr6+GLQm25JtVkDBQESlcKLx82IJZGlhEyW4/SSiVWyLuHQFrRSFtvlY4c
	aaucgjHKAYb52kjMZQlIXjKa/2xTkgFYD4khO+ozeVXjyD/GL0UTw75DfclYvvQGnrkC
	LZ3yzNtfiezy94X+hYM2/vAaj8nojYvKLncKsq7q16fKGo0wo/eESuq8IRkT+qZ0eyp7
	y7Sg==
X-Gm-Message-State: APt69E0A6BN+XcS3h4uBWSmqZqlfnhiFw5IZR5/rZwSVnyeT2JfWu/F7
	NEfPBDkPH04e9Y9ue5v6MEVNZ+sLyIk=
X-Google-Smtp-Source: ADUXVKIHfynDlSNrzoSVyG1KKBHLwETWXUId15d6PZlnfXpBtSFIeLFieTQvCe4rLHKO+GgzKNrxyA==
X-Received: by 2002:a1c:4203:: with SMTP id
	p3-v6mr12405417wma.111.1529405507560; 
	Tue, 19 Jun 2018 03:51:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n12-v6sm15312083wrp.69.2018.06.19.03.51.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 03:51:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 11:51:41 +0100
Message-Id: <20180619105144.10687-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
References: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] rm_work: Stop appending _setscene to do_image_complete_setscene stamps
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
X-List-Received-Date: Tue, 19 Jun 2018 10:51:47 -0000

This is a reworked version of the issue which 5479654eeaaa0f81bfff54ca49369c87f1658705
attempted to fix.

"""
Each time I build my image after the first, I end up with a
do_image_complete_setscene stamp file with an extra _setscene appended to
the name. Eventually, the filenames end up being so long that mv complains
and the build fails.

It looks like this behaviour was introduced when the special handling was
added for do_image_complete in 2ff9d40dc88d43567472218cf3d3faf414398c71.
"""

Instead of the original approach which broke do_package_setscene, add
an entry to explictly stop the stacking _setscene pieces on do_image_complete.

It's not straightforward to just move *do_image_complete* after the
*_setscene* pattern because do_image_complete stamps would then match
do_image*.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rm_work.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 31d99e4554a..07e63c31ad2 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -61,6 +61,10 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *do_image_complete_setscene*)
+                i=dummy
+                break
+                ;;
             *do_image_complete*)
                 mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
                 i=dummy
-- 
2.17.1


