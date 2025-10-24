Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A23CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:40:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.16111.1761324015001219829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 09:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivsQ5bsu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47103b6058fso17116345e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761324013; x=1761928813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XO26pF+bm+/vhWyIgoAqOgU82NbS28bvGv9ePq4MuP4=;
        b=ivsQ5bsu+KCAKb/rCLgT8IM7I1Edh0wzp4IzQpz8iNVXFA5unav5KH/5fjVhrfwcUf
         hbxkIMWOkS45JU2FiH00MjIvlqr+ArS2JtJDsbyeYbsQwyUlIC7Zy86EgfvkJt1mqrYk
         FDYqkvPgfoQ2hycNoEdq6sT4G0lf6nsQSrm36nu/s0bCVq4BNQk483c+gFg+sTkru1hX
         1nLiMrKKyELOjkdfVOuiItdkR/CQbdKxl9mQwb+/HsRFnsB+Zj0pkzjuMuYDgPGcl+yp
         68wWuFu0tlEMGwE1kxFse+mkY8EFAbxYn+5b8f9TQJzHqxA6HHajoL8sFO9MUhVCrUBn
         Vp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761324013; x=1761928813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO26pF+bm+/vhWyIgoAqOgU82NbS28bvGv9ePq4MuP4=;
        b=iLEkUSEf9JE8iMscn+fctHbilnc6UeJwuuCmO4M4SpLh1P/VRke9YyiL3EsI0VQDVt
         tqenR+/QOIcYAZaxxQl/+Ysntnag1+IzNc1yfH8dFq3pePFAeKncEfDh9p3DgcAHqNmN
         mQO1uC4RSOSYF2eLaUNZB9+kV5g/Auxn+NpgqRudDrNIIIXWRlyQAWZxy9AYA8pFrCoc
         T512tbK3CktutQ4/prGkNy8ngKnjJ0UOW3vQck7bes+7qOZvYKQkAvkqN+2E3T9pvK5U
         fpLMQdIqpJOXBGBSX5AjFic+2LHrswvzLluZnU+QpVzQVkd4T+LQq8+LuMnI0YWF1FoB
         mxGQ==
X-Gm-Message-State: AOJu0Ywps8Rveb29lpW9WJS4cPfsS8HgGufoF+PRfqOvt5z0kb77IQtH
	XtXJ0o6w6pH6uHzynkfwV50Jva7IFXNin3qjxSC6q3elQFsohuQtOiEhH2XbDu0e
X-Gm-Gg: ASbGnct+nPP2SF6DyDacyjpYdF1tbp6yCtcBgXV3PQJkOCUEYVzEPhgMyf8S08eoWYm
	IFQwVCnVLq+USl2w3Yy8y662fg+VsA3dOtEobnba0gGLdpfKU92wnEOob4+aDVVEEpqeVMDtVTw
	BJSwOhlTz+GRt/+fxF6gi2caUNZWYB7+enW0ucmixDHr/tiG/QHH9ncdsa8ZF/MGcFmDcZ90If0
	DLd3zrl5XbbHdzpRR2tQQSRFAp1Mqp5PZQwR3ssrTe/nPJ73EO0nk+ACUNIb+gBcoZZXR/3ldBH
	8yXdW601aosabeWG7NNjBVM2IdBagWotnju9dAIuLsgapq+lhVGS1eiZlIIvjj4XgH2vUPbMnO3
	TtsvgU3kyRDl44q6o7CLptZvKLACTGEQZVlan6pQq5q5YBXwKZVj2JPk3CGci3MRRTyFsIvXm8J
	DGOw==
X-Google-Smtp-Source: AGHT+IF/pqWs3j/b6UZr5CbduFmnswFVmcYCpUWot3xw21yAumGjnZlwHafwh4hEEDsW90uHLtJJnw==
X-Received: by 2002:a05:600c:2e44:b0:471:331:8058 with SMTP id 5b1f17b1804b1-475d2410fafmr16890085e9.7.1761324012929;
        Fri, 24 Oct 2025 09:40:12 -0700 (PDT)
Received: from osama.. ([197.46.164.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf152absm119275345e9.9.2025.10.24.09.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 09:40:12 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] bitbake: bblayers/query: Add --show-variants option to display BBCLASSEXTEND variants
Date: Fri, 24 Oct 2025 19:40:08 +0300
Message-ID: <20251024164008.4753-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 16:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225300

The bitbake-layers show-recipes command was hiding BBCLASSEXTEND recipe
variants (e.g., devupstream, nativesdk, cross-canadian) by design, to
avoid clutter in the output. However, this made it impossible to see
recipes like linux-firmware's devupstream variant which uses git snapshots
instead of release tarballs.

This patch adds a new --show-variants (-v) option to show-recipes that
allows users to view all BBCLASSEXTEND variants when needed, while
maintaining the default behavior of hiding them for a cleaner output.

Example usage:
  bitbake-layers show-recipes -v linux-firmware

This will now show both:
  - Base version: 1:20251011
  - Devupstream version: 1:20251011+git

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 bitbake/lib/bblayers/query.py | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/bitbake/lib/bblayers/query.py b/bitbake/lib/bblayers/query.py
index eb7cb465b4..11341d5d53 100644
--- a/bitbake/lib/bblayers/query.py
+++ b/bitbake/lib/bblayers/query.py
@@ -52,7 +52,7 @@ layer, with the preferred version first. Note that skipped recipes that
 are overlayed will also be listed, with a " (skipped)" suffix.
 """
 
-        items_listed = self.list_recipes('Overlayed recipes', None, True, args.same_version, args.filenames, False, True, None, False, None, args.mc)
+        items_listed = self.list_recipes('Overlayed recipes', None, True, args.same_version, args.filenames, False, True, None, False, None, args.mc, False)
 
         # Check for overlayed .bbclass files
         classes = collections.defaultdict(list)
@@ -119,9 +119,9 @@ skipped recipes will also be listed, with a " (skipped)" suffix.
             title = 'Matching recipes:'
         else:
             title = 'Available recipes:'
-        self.list_recipes(title, args.pnspec, False, False, args.filenames, args.recipes_only, args.multiple, args.layer, args.bare, inheritlist, args.mc)
+        self.list_recipes(title, args.pnspec, False, False, args.filenames, args.recipes_only, args.multiple, args.layer, args.bare, inheritlist, args.mc, args.show_variants)
 
-    def list_recipes(self, title, pnspec, show_overlayed_only, show_same_ver_only, show_filenames, show_recipes_only, show_multi_provider_only, selected_layer, bare, inherits, mc):
+    def list_recipes(self, title, pnspec, show_overlayed_only, show_same_ver_only, show_filenames, show_recipes_only, show_multi_provider_only, selected_layer, bare, inherits, mc, show_variants=False):
         if inherits:
             bbpath = str(self.tinfoil.config_data.getVar('BBPATH'))
             for classname in inherits:
@@ -203,8 +203,10 @@ skipped recipes will also be listed, with a " (skipped)" suffix.
                 # We only display once per recipe, we should prefer non extended versions of the
                 # recipe if present (so e.g. in OpenEmbedded, openssl rather than nativesdk-openssl
                 # which would otherwise sort first).
+                # However, if show_variants is True, we show all BBCLASSEXTEND variants.
                 if realfn[1] and realfn[0] in self.tinfoil.cooker.recipecaches[mc].pkg_fn:
-                    continue
+                    if not show_variants:
+                        continue
 
                 if inherits:
                     matchcount = 0
@@ -229,7 +231,11 @@ skipped recipes will also be listed, with a " (skipped)" suffix.
                     for prov in allproviders[p]:
                         provfile = bb.cache.virtualfn2realfn(prov[1])[0]
                         provlayer = self.get_file_layer(provfile)
-                        provs.append((provfile, provlayer, prov[0]))
+                        # When show_variants is True, use the virtual filename to distinguish BBCLASSEXTEND variants
+                        if show_variants:
+                            provs.append((prov[1], provlayer, prov[0]))
+                        else:
+                            provs.append((provfile, provlayer, prov[0]))
                         if provlayer != preflayer:
                             multilayer = True
                         if prov[0] != pref[0]:
@@ -238,10 +244,12 @@ skipped recipes will also be listed, with a " (skipped)" suffix.
                         if not items_listed:
                             logger.plain('=== %s ===' % title)
                             items_listed = True
+                        # When show_variants is True, use the virtual filename for preference check
+                        pref_cmp_file = pref[1] if show_variants else preffile
                         print_item(preffile, p, self.version_str(pref[0][0], pref[0][1]), preflayer, True)
                         for (provfile, provlayer, provver) in provs:
-                            if provfile != preffile:
-                                print_item(provfile, p, self.version_str(provver[0], provver[1]), provlayer, False)
+                            if provfile != pref_cmp_file:
+                                print_item(bb.cache.virtualfn2realfn(provfile)[0] if show_variants else provfile, p, self.version_str(provver[0], provver[1]), provlayer, False)
                         # Ensure we don't show two entries for BBCLASSEXTENDed recipes
                         preffiles.append(preffile)
 
@@ -530,6 +538,7 @@ NOTE: .bbappend files can impact the dependencies.
         parser_show_recipes.add_argument('-i', '--inherits', help='only list recipes that inherit the named class(es) - separate multiple classes using , (without spaces)', metavar='CLASS', default='')
         parser_show_recipes.add_argument('-l', '--layer', help='only list recipes from the selected layer', default='')
         parser_show_recipes.add_argument('-b', '--bare', help='output just names without the "(skipped)" marker', action='store_true')
+        parser_show_recipes.add_argument('-v', '--show-variants', help='show all BBCLASSEXTEND recipe variants (e.g., devupstream, nativesdk)', action='store_true')
         parser_show_recipes.add_argument('--mc', help='use specified multiconfig', default='')
         parser_show_recipes.add_argument('pnspec', nargs='*', help='optional recipe name specification (wildcards allowed, enclose in quotes to avoid shell expansion)')
 
-- 
2.43.0


