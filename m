Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB39C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 21:33:11 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.web11.6925.1748467990707999692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 14:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=kcI+bvU+;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=F1trH/TC;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.156, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AB9871140139;
	Wed, 28 May 2025 17:33:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 28 May 2025 17:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1748467989; x=1748554389; bh=mmgLAAow/7arhPQ6hw9TR
	om5siHGDtOjAEwjCf3T4CI=; b=kcI+bvU+DKJ+vnC0AyaX/z2K9NMXmIymfiis4
	I04jmAR6EIoo2TKAfbvqVZmh/xn/dNAVd8DF8FzNLQMZDGUCcthNH86ZX2da0Cqo
	Qfd6swI26m5PPGc7VWzlI2U1hTHq5pddKyCvFSBwSGV6Ekv8VbGDQh7SRF1YK2St
	xSJC4B1mHq+2zbUBfqIDkdGLqx3jGGgVfYCo9gDKfC/ooitbOm/PlGCT32XhjExy
	ngwXS0vVdXHAq7iobRmsGuLUdjNOnkxrQwkQaJNUFAjavoEG7oIGDpWAqQ4OnlU+
	/3sBCX3is1lMalfjpkKCVvFE6H838Qk2srR08WVjZIsc7R6Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748467989; x=1748554389; bh=mmgLAAow/7arhPQ6hw9TRom5siHGDtOjAEw
	jCf3T4CI=; b=F1trH/TCRMI9pABdoAUBOSLMeJoCmz0BMgJGUhYx1bgSV8eB81N
	7qNtecS/BERVSTR3pQh9JlJs7g0BlfyiEiu8yDDXeX+bIyFVrgfHIGgSdOGdS62z
	5wGg0uhMNXkIRAIwMWSSfn3M7BAmPwnUYbs6iF1EYHACfKCshDNE+7N0zy4Jr8sQ
	7LPdJ9RvXfxwv8q1DPH3TYbxfVwKiJwsW0s9NQdSMh821pFDNGhxOeb8g5kMkldb
	K4/DKCxywTp1W5h75m9WofEj7gHeJI3yubQfV2/L5Z/5TchhgmYjGAsmS72kXVrb
	BEdBIQgvvcBhXvrwm1ncC4heIP/r9n1xjDg==
X-ME-Sender: <xms:FYE3aBl1NL539GkgXt6-zgGid9AAf0SG217wAKZbs16BI2aQrm8Dnw>
    <xme:FYE3aM1tjAasF6tKPekbFAl6gSI6pHo0lXcn_vijkIMbXOPv784kgvIwYD5_g1BJP
    4N_dNtLkjSCYTn0WJg>
X-ME-Received: <xmr:FYE3aHpGzeqZ153g3uJRo0KtJF7Tc13KctqWm3QNMErhEkyVz5peWmh893A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvgeefheculddtuddrgeefvddrtd
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
X-ME-Proxy: <xmx:FYE3aBkKFHD1uP-FfTt67CCCGUWWFraqJoG-1lKGQqFztuA-vsHu3w>
    <xmx:FYE3aP2G6vJCDQHNxK9BQn5_Bx2JVX2EWlq9-wC3dnfc81gRSPxFjQ>
    <xmx:FYE3aAtkRXv5ZTrWBir1EuYNrpt7SHfB0X-TIK99tli48avi23iCGw>
    <xmx:FYE3aDUMLwtKO4Sbz0SILfN0IWemwuAVDHG2G5dOwilaXdXxH-g5VA>
    <xmx:FYE3aDItYubXJ0SW6wWCCAFxya_DwipBZStVHq2Xe8cHSHwDNxlbH197>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 17:33:09 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] systemd.bbclass: generate preset for templates
Date: Wed, 28 May 2025 17:33:06 -0400
Message-ID: <20250528213306.2581115-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 21:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217397

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
index e1fe4ed072..3cc53c44d9 100644
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
+                if '@' in service:
+                    (subservice, instance, service_type) = re.split('[@.]', service)
+                    template_services.setdefault(subservice + '@.' + service_type, []).append(instance)
+                else:
+                    fd.write("%s %s\n" % (action,service))
+            for template, instances in template_services.items():
+                fd.write("%s %s %s\n" % (action, template, ' '.join(instances)))
         d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
 
     # Run all modifications once when creating package
-- 
2.49.0


