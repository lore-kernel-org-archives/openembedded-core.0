Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABB8C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 10:47:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.16698.1739875639640656818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 02:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NsKLAPaM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4396f579634so17021725e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 02:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739875638; x=1740480438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOAgGSfb7wW3ebCltQThTqjW86n8WPcMK+5+A7ex8aA=;
        b=NsKLAPaMbV2ar5XySUvQ6fku++Qj0lQUeR/RF7gPwMlCU5p1KOtnOiu5WXCnB/3U2f
         4NQN7kvuczr0ukCYaM1G9/ZYlLLKrlfaEuXmrOlsO49ytvznuPHiVZBmH+OFGxiV2T2m
         blxsJW0NDJqGN8Evzp7MsWPnwBMsSiqUEx/I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739875638; x=1740480438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOAgGSfb7wW3ebCltQThTqjW86n8WPcMK+5+A7ex8aA=;
        b=o+GJleDJWnoA0RbENrD1jD8cakLh4pDBb2YZBlslOwhXKvvfw96FroDh3pdJFgkgPA
         JWEeaIs1y67DYOyAg77gDr9lMA2Bz0V6Xxi4yGGE29gmdJ91/Ux4qUGATTERQ95Y2gam
         +1qZoUOqzZKLrOo3BC+es+fJFPjyAIZcw+FOhrwqrC1kEZCEMF3n//eLuV1HIflJ6qQS
         ZMyuKne0kaRVDuuqI+4b+u3u6TVANHSOu9eKjBZnfm952gBw5PrrPy9MQvVgupcabAsJ
         9GixcKpObBoqIqtcc7i5PnK8zV1EWDpXn/WwF/yf7B4xw5AZzuuyj66RPR4KGwhJonKd
         eebQ==
X-Gm-Message-State: AOJu0YyvanEd+PYFfhG77PH/xQOzBxbZiKghu5IEq3Fg+GdUgoxe6oBw
	zBRafUHqcxLnEpCG8/oIknZ/V/0AwSxXJm2cArtv0GsZ8WW6pELX0jw5zliYKJ89pkNjjVY78du
	+
X-Gm-Gg: ASbGnctOScFd7+sYlnrJCwT6XcldsliVP8xSJEh0aktQCv+d7+IqLFkcX8sJMqG6YSt
	Qdz3yTpEf4iormgFVnmOauI+0vLV3kldG/CT1ClBHohGIj9UhyGkE5iEx+LOGpXGsOogwswfRn2
	0ZUfZS2r5xO8mIMS1v1dDdtXTi7dAEYSfNKOdgUGw8Lp14G0wUji3KOSY154DQvdN1qdq3KuDpR
	S0j3/msA1vbRtKPqcziUqvPo00eZDBuDAQ3SwD2OwyO09TD1yqPWdUA3ITP/msG7QspY5QzkvWu
	M+tXiLeCe7YgafFkhXBW/8HA4uYJunTWpb93wGu/ug==
X-Google-Smtp-Source: AGHT+IFkwNKNa1HUDBFvUDGZpBPd1t+gFupdAB6ltmG9L0j84U3075n8rpNVnVZBbMkJbDsUMJukJg==
X-Received: by 2002:a05:600c:4e45:b0:439:8346:505f with SMTP id 5b1f17b1804b1-4398346524amr61111105e9.20.1739875637621;
        Tue, 18 Feb 2025 02:47:17 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b432asm14364490f8f.6.2025.02.18.02.47.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 02:47:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oeqa/runtime/connman: Drop unused test
Date: Tue, 18 Feb 2025 10:47:12 +0000
Message-ID: <20250218104712.1362661-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218104712.1362661-1-richard.purdie@linuxfoundation.org>
References: <20250218104712.1362661-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 10:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211603

This test checks for an IP address and then tests if interface aliases work. We
don't run it on any of our automated testing as it only applies for non-qemu.

The connectivity test is unrealted to connman and pretty pointless as it depends
on ssh being working, so networking is probably ok.

The alias interface test is unrelated to commman and a general networking test
but seems out of place.

The code uses obsolete ifconfig calls and overall, the value of the test we're
never using seems low. Delete it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../oeqa/runtime/cases/ethernet_ip_connman.py | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
index eac8f2d082b..4e671ec0ccd 100644
--- a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -9,24 +9,6 @@ from oeqa.core.decorator.data import skipIfQemu
 
 class Ethernet_Test(OERuntimeTestCase):
 
-    def set_ip(self, x): 
-        x = x.split(".")
-        sample_host_address = '150'        
-        x[3] = sample_host_address
-        x = '.'.join(x)
-        return x
-    
-    @skipIfQemu()
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_set_virtual_ip(self):
-        (status, output) = self.target.run("ifconfig eth0 | grep 'inet ' | awk '{print $2}'")
-        self.assertEqual(status, 0, msg='Failed to get ip address. Make sure you have an ethernet connection on your device, output: %s' % output)
-        original_ip = output 
-        virtual_ip = self.set_ip(original_ip)
-        
-        (status, output) = self.target.run("ifconfig eth0:1 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 down" % (virtual_ip,virtual_ip))
-        self.assertEqual(status, 0, msg='Failed to create virtual ip address, output: %s' % output)
-        
     @skipIfQemu()
     @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_ip'])  
     def test_get_ip_from_dhcp(self): 
@@ -39,4 +21,4 @@ class Ethernet_Test(OERuntimeTestCase):
         default_gateway = output
 
         (status, output) = self.target.run("connmanctl config %s --ipv4 dhcp && sleep 2 && ping -c 5 %s" % (wired_interfaces,default_gateway))
-        self.assertEqual(status, 0, msg='Failed to get dynamic IP address via DHCP in connmand, output: %s' % output)
\ No newline at end of file
+        self.assertEqual(status, 0, msg='Failed to get dynamic IP address via DHCP in connmand, output: %s' % output)

