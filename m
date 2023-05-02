Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4D5C7EE21
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 09:14:29 +0000 (UTC)
Received: from mailrelay5-2.pub.mailoutpod2-cph3.one.com (mailrelay5-2.pub.mailoutpod2-cph3.one.com [46.30.211.186])
 by mx.groups.io with SMTP id smtpd.web10.124420.1683018867048915872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 02:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=kj+o5SSW;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.186, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=mnduOL01kR4mXT0bojoH1v/mx5RrG7CM3SUudbL5JBI=;
	b=kj+o5SSWlJn7Xl5R3an44InPktUOShiAxf1RPDBFxQa4wq0r7bTXrBCvB0Ft/tChL4scgs9OBHOmL
	 rKNNBuicmhbH+PsUt+Cj3aDtvHz/a0oxbCkA3LtBHnmg8Eu2zEm22NpivEvOpUflyrR9ioooF8bt4X
	 i13m0NnSp0KuJA5G0e7wi5S3ZNonNxzB3KAeKlz9/jbPIFJeX2I6Ppyo91my1EOC5EBAfK/u2+pZ+i
	 hqQsfCK5yxZ5tpP+/0C8fCYPrhHLfLXBA0uQjPnoGTzxuIyMOLLpqcpwLfHlg40sL3Z01XmjkSqhBC
	 pw2elgO9s5W3T4D0QYAWcgQLh0sC7Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=mnduOL01kR4mXT0bojoH1v/mx5RrG7CM3SUudbL5JBI=;
	b=j8seXSAChbWeJ8jY4sPfA9DxaSztJA+fxZ+6EFp9n+5KXF4OtVkox8ovrzbU5gEz1vSOpQeLSCdVc
	 vVI3wpACw==
X-HalOne-ID: ba4f8c7a-e8c9-11ed-b560-231b2edd0ed2
Received: from [192.168.100.228] (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay5 (Halon) with ESMTPSA
	id ba4f8c7a-e8c9-11ed-b560-231b2edd0ed2;
	Tue, 02 May 2023 09:14:24 +0000 (UTC)
Message-ID: <32f72c25-86e8-498f-c652-d7d4cebda807@berginkonsult.se>
Date: Tue, 2 May 2023 11:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Peter Bergin <peter@berginkonsult.se>
Subject: update-alternatives.bbclass - is this a leftover from old override
 syntax?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180716

Hi,

I stumbled on some code in update-alternatives.bbclass that I suspect is 
missed when we changed to new override syntax but I'm a bit unsure and 
would like some more eyes and comments on this. Doing debugging with 
logging I see that the class is fetching variables like 
'ALTERNATIVE_${PN}' in the code at:

https://git.yoctoproject.org/poky/tree/meta/classes-recipe/update-alternatives.bbclass#n89

I think a patch to correct things could be:

diff --git a/meta/classes-recipe/update-alternatives.bbclass 
b/meta/classes-recipe/update-alternatives.bbclass
index 36a7497fec..b153e1b297 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -86,10 +86,10 @@ def gen_updatealternativesvardeps(d):

      for p in pkgs:
          for v in vars:
-            for flag in sorted((d.getVarFlags("%s_%s" % (v,p)) or 
{}).keys()):
+            for flag in sorted((d.getVarFlags("%s:%s" % (v,p)) or 
{}).keys()):
                  if flag == "doc" or flag == "vardeps" or flag == 
"vardepsexp":
                      continue
-                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, 
d.getVarFlag('%s_%s' % (v,p), flag, False)))
+                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, 
d.getVarFlag('%s:%s' % (v,p), flag, False)))

  def ua_extend_depends(d):
      if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):


This is just found by review and I can not find any failure or fault 
that is caused by this. That's why I'm trying to get some more eyes on 
this and see if someone can fully understand how this is connected. With 
the patch variable flags for ALTERNATIVES:${PN} is fetched instead which 
should be more up to date with what we have in recipe meta data.

Is this something to send a patch for to fix old override syntax?

If yes on the first question; as we haven't found any issues with the 
old code is it still needed?

Best regards,
/Peter


