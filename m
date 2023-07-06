Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ECFEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 12:51:10 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web10.21313.1688647868954479629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 05:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=dl9pf@gmx.de header.s=s31663417 header.b=tah33t6D;
 spf=pass (domain: gmx.de, ip: 212.227.17.20, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688647867; x=1689252667; i=dl9pf@gmx.de;
 bh=hcun0J7Yopx+kLQw+h6VhEBPliRvpPOiY5Ji6viI0+0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=tah33t6DupqUDQw0GCt9ZYhKXC/c4oCGZQKA/awezb+BwJPmHVSUruzzwvWAjo36jSxiu1Q
 WMJ2I+YVTuo164TqzGAc4HGmautrxNVyG5AHmK+PWBoIb/mIR+tNqA3B+FJaVNjNOjIyuk5q6
 buicZq/08fvK5JMksiZ3AcGB/rx5yofAFlInb0SXCUGHVAwwSLltbHhalu7QT21ogrV4gbCXr
 BJy8jFoJtva3aiD7lOFd+4ids2v/Ib7gsbDbdSFehK8INiOWYuZx08RCc1JGjU03QPIfny+cs
 x4snwOMVjeRj1jVBa47/Zj1QryIXDRwG6OvScg4O4g35UUIL2L2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from gmx.de ([77.23.145.57]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsUC-1q8YkF0exs-008oLW; Thu, 06
 Jul 2023 14:51:07 +0200
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Cc: dl9pf@gmx.de
Subject: [kirkstone][PATCH] backport patch to oe-depends-dot
Date: Thu,  6 Jul 2023 14:49:23 +0200
Message-ID: <20230706125052.6541-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Provags-ID: V03:K1:LQslSaiM2xkR3XOg398wHmmedDVl2xU2+ZABG3D3Mon4h6lg2jV
 RslyrUKtUlm8nxjEmKdhAyIyn5DulinnQORpu78dCyn3SeTKjlHEDgH6mCePlwfRIvxDSIq
 rLhhtH47LY4bEvWnLx6pszBY4hIs3k5uK204SBl6CvrbkUcEJfhtu9tCKdYaWyI3ExE+gjE
 FUmp40E6ns6N/u3Zl7cEw==
UI-OutboundReport: notjunk:1;M01:P0:6PUYU29dGxk=;UrnJ+aWwtazq1NRTalO4+VkknVx
 YZQDXF1ZXdDjXmkjAEHvQYvLzXK6Dd8yVjRC1ac6TjGSF9VUzy2EgAiAivADqkIQKhTtazRgc
 HeC8KDpRPTiegnkvvG1IZ1j+h81axvozntuhdlOcl8EQd1N6Owa0/iJG1yVCBQVTXGD7zGZNW
 fpNtysNKjVVgUFRjwnwU49c3KNBun+kyBzI9PmFAqiAl9N74qxyiiUg7RXkXcITGG18P0D3Vu
 5p2Guov/c8Odt92DZZYhO3QMk88aLVfka+V5SjbgeZTT6U6fDc/ZasJlHpt9oeG/9oTXDNwG8
 5fb7KzXw7eVaRkEkG2H+T3bceFNZWU//D6DTaH6MHFs2BVqtUwiPzA8SqPzdZ5dynarU2w3Wi
 Ip8jzd+on7B8os2WrSgRK7sTZSgmK/T+1XyiW3BcZDZxYZG3f8jvGMd1L+S738Dtwuo1sANdt
 PqxeVbleFtiskQKgaiuYmrksIFfV93o1AFC3g29kObGcZZixMSGpAFpkWZhUEjmT7OxEqrSaI
 OhCz9WqgJTwPih9jP519Ripyhz3LCKsk2CA6KLGT9XBfGpXjJ7mbjMgPkifqYvmhDzzG4qOI3
 GQTarYuh9RjADg4vHza6PuGyZ7yQX6Vj3EK/c/1OVI32Pqk1pHNUpt8uRLW3wep+lN87GDA+y
 ljC5UmAZQ+6nIbLQ/u4fOc9lwkKrfQ7WkQSj2AxNHy1zhqH+d7fCNtLvvgoeQk+q3vhMveAip
 zXIByT3G5y76pxTmy7vjA9Xw0At2f4ORZa2EbVP677WnSw8GSRvv5kSIm74Edy4g6yONGOv+k
 8J5rNHF2O5kX6KksEBByLWXHBX5TlJl9Viz3R+dMqNim2xN8/PuRQCfnrdBHZ6z7WZXCeTCc2
 PE4STNGppqx2pz/aEKfPVSFIzdT+cz0GDiGDRtNac7fcCNTAWH9ERyyjAMU2k2isu3tSBoJiW
 BITuZA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 12:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183938

Without this patch, the call to oe-depends-dot will have no valid output.

Best,
Jan-Simon



