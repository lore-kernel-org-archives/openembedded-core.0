Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C281BED7B94
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 09:27:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14757.1776158831362982584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 02:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j7/g3jOy;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ba840146so51990415e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 02:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776158830; x=1776763630; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PlMyH+6Aa72GvbIl/wVeSke8eIeX/c7T1s46dNcQxZw=;
        b=j7/g3jOybWfP2uD/JF7+kB+3sUUAvDW2nxI8MYBvY4yHGkCHAh105q2leu/Qyuf+2p
         dWTkEWsDG5zA9G4mknKWJYt9sJnNHb29nP5jS4NG3xzX4C6eRkRoLhjgKDcV9tV/X5q0
         aCVbkthtUn4qTOwoC4uNHTVjjtqWN1SzYO9aCFxxooqTSCHE5rQcWTS8NUkDHhPJUVwW
         6ncfYpG3JjGtcMTS4wKwzcNVe1r9Jp5eRKZFZWX/KElomjlJkOW/zmzd8eTj2Ojlez0g
         nJYdq5qnGScLBni4rpZfajyFoTxd3fo8mc672tqgfopjgaKcadxPurFEqKybc5MJLMZg
         +C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158830; x=1776763630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlMyH+6Aa72GvbIl/wVeSke8eIeX/c7T1s46dNcQxZw=;
        b=oGxI86+aTldFT3xOKfiGDpkl1dmI8Cz3/5F0NroIZEIc6SddvfotWU2DBNdYQedDUp
         9OaQgvJlsW51G5QQ5XiQrRp4CmFgLz9HcIXhttI3+E/SbsQFrY0peQbHg2hjQDirZQWI
         Aw02ny1np0A00E2skEY4zaDDuv5eMMF5ibZ2UTGfdWxr53YSHG+rWB/dUqfSfaGZdIbW
         pIhNRYNGBLhtroBKw7uS54F4G3ULXHGNcJShnQsNPxisTReXWBDMh1Y111Vui0K3qW21
         Z7fJAsIpZaRLLoOOijgeFMUX5nEt7STucggMO98ghzq1CgNBbyBK+AI8uBaTi0itpMFF
         htcA==
X-Gm-Message-State: AOJu0YwVxS2M54BXjUr1ZiIvGTno5fuZDlXFjmj1IH931hwlJA7+tSiw
	QFiZYDkzV0s+z9o3jseHfSrNnMqHHK3hnCyKhHCSJ1VxNF0a/iVdke2Y
X-Gm-Gg: AeBDieuoRqyK7+7xSkqIFSbC/gSjkt8lJfVV2hDHx6nEVLBZy6zcF8TPSvj50B1EDPC
	gVAxZbKU6J3n1JWuYSQR790wBIGIpCJLtKNxCDJxE6HLXnixKdkACUpXHHMZaOH9nHBNVRr4XFG
	/aMaTr2KqDeWetLoX6LLYaKXfs2lWQtaHDkcSuQSlYdMPs6EhDKr4lL+546dA7AEdUlsDPefKtw
	k8GV89IK7Ri4+7G76gvoY7Q8sAXmivPZhpPkRuP9OiTmkckbK7U8BlxPNdjzrWIGhYDao3jvj2o
	EKkb9SKjtnGrVxtK/4Fzd6l9/0V85rk/wOPaYe+qz0NR9AYurSTco5/gnUXcphd+fGoQQd9qPvg
	8JrWCy98u7Dh2lWs5KkaOVe7KWLt4K46WPMcDL+KB5sNn8VX6IGRDv/Ss1Fe1wZT2i+aZSHQVCG
	8t+0H4zHE5euyB2MJSOQvUsbD3isp5/Cgwr3/gduN07D17NPLzCzMgNL01hG3TMLr7517fEv93w
	UDTsNI2y20CaXgDYzQr1mB9iTUWyNQOLWOjdNku54b8LOtvrbVxgL73KpiIHOmyXjJ0tXq3lIyC
	t0eO60W3
X-Received: by 2002:a05:600c:350c:b0:488:9661:2570 with SMTP id 5b1f17b1804b1-488d67ce8c2mr237716295e9.8.1776158829427;
        Tue, 14 Apr 2026 02:27:09 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e7e45sm174611925e9.9.2026.04.14.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:27:09 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:27:08 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, 
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [OE-core] [PATCH v1] gnutls: Add p11-kit for native builds
Message-ID: <cz3v2heuizihvtxludocczzqwrtjzbrr4zitsr6mldkkh5nzhu@ij4vh4tqjpes>
References: <20260408130553.819420-1-fra.schnyder@gmail.com>
 <4200cb9070f15e74f779cb7f752b450977871ec2.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4200cb9070f15e74f779cb7f752b450977871ec2.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235147

On Tue, Apr 14, 2026 at 08:36:35AM +0100, Paul Barker wrote:
> We've decided not to take the U-Boot 2026.04 upgrade for our 6.0 wrynose
> LTS release. Is this change still needed for U-Boot 2026.01?

Hi Paul,

This change is not needed for U-Boot v2026.01 or v2026.04 but it 
probably will be for v2026.07, since pcks11 support for mkeficapsule was 
added in U-Boot with 
commit 0c716a157be ("tools: mkeficapsule: Add support for pkcs11").

King regards,

Franz


