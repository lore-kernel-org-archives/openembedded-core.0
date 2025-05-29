Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616D6C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 17:44:38 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.web11.27244.1748540671693794060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 10:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=aR4vUncM;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=oP8JVlF9;
 spf=pass (domain: stwcx.xyz, ip: 202.12.124.147, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id DDD5711400E5;
	Thu, 29 May 2025 13:44:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 29 May 2025 13:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1748540670; x=1748627070; bh=RtlJBHZb0o82w8eGFhFmz
	rRstlj9ZQjsL/PrzrfboHs=; b=aR4vUncMpYMX7JNX1VWbHRVJEOHKAcHfPlDXo
	JGmVk56Qg6fg6vVaISzMgqaiy3p6zel85FzNaaJ64qYEWROPh4SEVQxT8YUtU/Ds
	+OJPAZLk83pas39xClzVnPUEW3BVO6pC9oMDUB7NQ6bI4yg6q1Z9CFac5Wbs/iNw
	fKVN8JYpmp/+rJrd4KSCDe6kvVGvD9lfE70xXnpSVXETw27/fLcMonT5Tt+11zLP
	0gZa0Eglq5GPlYlApFHNCygmHHmmbJiItXYo+oMR3aBnF5zs5EP1YrLH0tiydHUU
	tI/Iwe4um33xRV98gybeerqV7aySbekdCw2vOgZrn9U76RQIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748540670; x=1748627070; bh=RtlJBHZb0o82w8eGFhFmzrRstlj9ZQjsL/P
	rzrfboHs=; b=oP8JVlF9GMBIhK8DGbg6t4ur41n1DGeDxp0o6ImeiW6/Ao9xo47
	NUs/esW1cA59qWDUv9VsJNSFuBX2cLXR28TFS1Fv9jQuCNDhUXOyw1ZqHG96eq1L
	tbg8PnPe7t49IMLbXidsSRxmdKoY+8SB4GpPSxv+YzJBWves3HBzwlPfwgdwQZnE
	FuVDMiEcYN+k6Me+hgLhMi29409qg8YeMQjMDFlOOa15AUdAkwugbMr2stomoGvz
	Udp0izfhhkPyW/TVd6JlATDDxf7lH/2Cv+AW7sIn08iC8mDsDUobmxcjzZ/gKxaM
	D7zK85Vm/nqLSbl6UIVIfHV32lBS4RNo0TA==
X-ME-Sender: <xms:_pw4aGWjM07EUxtLYI_8aKA4Qq8M2pLyPU2gezK3ObpUKTSjl2ad4Q>
    <xme:_pw4aCls2y-XTE1YPkp31WMeaGBGVnQQbAS4wGgtMPiUKZoBGolC3SwrPD3AXNKIP
    G7iQDCCyB_wOTEAPfs>
X-ME-Received: <xmr:_pw4aKY7xr5FfDj6HCv7kTbeAJA2YvxN4_Olhj7UQPwJDp6zgUGKvSGW3AU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieejieculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecufghrlhcuvffnffculdefhedmnecujfgurhephffvvefufffkofgggfestdekredt
    redttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgedtffevtdfgjeevfeehkefg
    vedvtdehudeiffefvdejtefhvefhgfehgfethfeunecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghdpfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipd
    hnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgv
    nhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdroh
    hrghdprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:_pw4aNX16YmIWDm-p-RCtxoKLRvU3yDsaxLbq7CoJyYYY9tkRTTi0w>
    <xmx:_pw4aAnOGn4Raypv7WF5WZqMEE0GPOYA8wmCwgVwj_5jgVWb9aUCWg>
    <xmx:_pw4aCdsuAUs5dVQ-AjxdUolc2OM1-X3A4xaSJdyrhpfY8dsVwEEHQ>
    <xmx:_pw4aCGoQhkkUAsaTocArd8yE5Vx3cwWTizM5Z9CsAzKVI7uqq2URA>
    <xmx:_pw4aD7qXg3YqSAOUU3xbxZpEO5xmcbm4enI_xIhbVINzavLKz8guZuB>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 May 2025 13:44:30 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v2] systemd.bbclass: generate preset for templates
Date: Thu, 29 May 2025 13:44:27 -0400
Message-ID: <20250529174427.2731440-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 17:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217430

There was a regression introduced by the change to use
systemd-systemctl-native rather than a python fake implementation,
which caused template units to not be properly enabled when set in
the SYSTEMD_SERVICE variable.  Through investigation, it seems that
the best way to re-enable template instances is to handle them
explicitly in the systemd.bbclass and enable them with `preset`, like
most units are handled[1,2].

Per the systemd.preset manpage, the format for template units is
different than for regular units[3].  We need to coalesce all the
template instances onto a single line and emit them as an additional
space-deliminated argument.

Ran this against openbmc's phosphor-ipmi-net recipe and generated
the following preset file:
```
$ cat packages-split/phosphor-ipmi-net/usr/lib/systemd/system-preset/98-phosphor-ipmi-net.preset
enable phosphor-ipmi-net@.service eth0
enable phosphor-ipmi-net@.socket eth0
```

[1]: https://lore.kernel.org/openembedded-core/Z2ch.1747051947055246176.oktf@lists.openembedded.org/
[2]: https://lore.kernel.org/openembedded-core/aDdoTVtCmElpURYD@heinlein/
[3]: https://www.freedesktop.org/software/systemd/man/latest/systemd.preset.html

Fixes: 7a580800db39 ("systemd: Build the systemctl executable")
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/classes-recipe/systemd.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index e1fe4ed072..b82572f8b4 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -224,6 +224,8 @@ python systemd_populate_packages() {
                         service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
 
     def systemd_create_presets(pkg, action, user):
+        import re
+
         # Check there is at least one service of given type (system/user), don't
         # create empty files.
         needs_preset = False
@@ -239,10 +241,17 @@ python systemd_populate_packages() {
         presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg))
         bb.utils.mkdirhier(os.path.dirname(presetf))
         with open(presetf, 'a') as fd:
+            template_services = {}
             for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
                 if not systemd_service_exists(service, user, d):
                     continue
-                fd.write("%s %s\n" % (action,service))
+                if '@' in service and '@.' not in service:
+                    (servicename, instance, service_type) = re.split('[@.]', service)
+                    template_services.setdefault(servicename + '@.' + service_type, []).append(instance)
+                else:
+                    fd.write("%s %s\n" % (action,service))
+            for template, instances in template_services.items():
+                fd.write("%s %s %s\n" % (action, template, ' '.join(instances)))
         d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
 
     # Run all modifications once when creating package
-- 
2.49.0


