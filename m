Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.5730.1613558570826160258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 02:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Toc+kYvA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id 7so16919682wrz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=EC/5aHTcgGyzKX/0cBaqVWusNOBMJXicvS1h+oOnIzY=;
        b=Toc+kYvAWUiRJ3di7wxSSP++wX0CPXMwc+ImxwjCL12Amgi+vVHF+cKwiMuDzwqAar
         R3/K1M1ybsYhW1tJRoTTY6DXZECUk+3xVGGXYJpuSQCHpJJmsqHit75po7bqy54S6Sm3
         y8VG0EqTW2n1y2SvQSDYPL1OY+R5RWvoOG/ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EC/5aHTcgGyzKX/0cBaqVWusNOBMJXicvS1h+oOnIzY=;
        b=ASpQlbZMr2PgcB7dEZkcCvDwAQQUly048UWe0EN8HffVHFSFHsPpw2pua92FtxyKOS
         IdtPeYCDTg9zDDX13QsSR03TifJsx81n3vgN22vQFqM+GYtGDJsBCc/byW0ZiKjUhcvL
         1DDQJ3fRqviWmyGsYK8OjWkJAHh1pWJcXb28o9gyf7gDsk288/LMh0c4gw/Wv68kkV3f
         Rc0lNf/cxTNootWt6QAnGMwc7hQg0RgAgZoWoLm5wiyIT0M6yqAWSQzBKQBs3UCP+IZK
         vQg2dKQsHN0pyS+BUPHrVpxuT6STdPd3iNR52t90vwCiOlL28BTdQBtebivdvKVocz0y
         oQCA==
X-Gm-Message-State: AOAM53364spFfFUVaZ+AJVwPRhqDLSG16cLCuuYbd4Dyntl4IsVO2YQ/
	xwArR2DNPSuN9SY1TQad9kIzKw==
X-Google-Smtp-Source: ABdhPJwMv1RfI6auMXP/mjyp6Ifk4kz0DM97ssuW9BmchC+CdLTxC3bWATxh7Xy3gPnkZLaVsYEirw==
X-Received: by 2002:a5d:4564:: with SMTP id a4mr29887588wrc.66.1613558569455;
        Wed, 17 Feb 2021 02:42:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:19d:cb66:14ba:c267? ([2001:8b0:aba:5f3c:19d:cb66:14ba:c267])
        by smtp.gmail.com with ESMTPSA id t15sm2306219wmi.48.2021.02.17.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 02:42:49 -0800 (PST)
Message-ID: <e9177cfa848266106e22e054cd4d19c4357923b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 1/5] package: Remove false positive lic warnings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2021 10:42:48 +0000
In-Reply-To: <20210217040033.21541-2-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
	 <20210217040033.21541-2-idadelm@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 05:00 +0100, Meh Mbeh Ida Delphine wrote:
The recipe LICENSE strings are split into their individual license and the canonicalised to easy enable matching with licenses of sources.
License strings with "or-later" are replaced with "+" before comparism.
The warnings showup if and only if licenses in the sources don't match LICENSE value of the recipe.
Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ab96f141ae..c3259146b6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1545,6 +1545,7 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
 

 python emit_pkgdata() {
+    import oe.license
     from glob import glob
     import json
     import subprocess
@@ -1762,7 +1763,21 @@ fi
             lic = d.getVar('LICENSE_%s' % (pkg))
             if not lic:
                 lic = d.getVar('LICENSE')
-            bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglics[pkg], lic))
+
+            # Splits the LICENSE values and canonicalise each license
+            # in the set of split license(s)    
+            split_lic = oe.license.list_licenses(lic)
+            spdx_lic = set([canonical_license(d, l) for l in split_lic])
+            if computedpkglics[pkg]:
+                computedpkglicsperpkg = set([])
+                for l in computedpkglics[pkg]:
+                    if l.endswith('-or-later'):
+                        lic_ = l.replace('-or-later', '+')
+                        computedpkglicsperpkg.add(lic_)
+                    else:
+                        computedpkglicsperpkg.add(l)
+            if spdx_lic - computedpkglicsperpkg:
+                bb.warn("License for package %s is %s vs %s" % (pkg, computedpkglicsperpkg, spdx_lic))
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"

I added your license changes from back in October into master-next.
With those changes, the "-or-later" piece should be uneeded and happen
automatically?

Cheers,

Richard





