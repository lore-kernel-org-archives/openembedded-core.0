Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08DBCF045C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:11:48 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.5996.1728630705386129470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+Imd0++;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a998a5ca499so241499266b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 00:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728630703; x=1729235503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BY9zGSxapKEse5IaWemdzA4VO+IFkn0GTLzBBm6O9N4=;
        b=U+Imd0++BcaJm/XbROu/2onVRKbEVbEBTVR21uOm6OIBG3wJNvICVITulbLfOcFlca
         sn5yyIay6PqFhSQ37gfGhmOQahME5G5I0+egsLSfaGqIfV+Ujk32mXD/gdICBxhcoBso
         vuRbeap3HZLxLq1nF7HncOow9N6NREASpY9UYILEY34NDGTVhKZl9TuzqsEHcO0hI0hX
         k2mf+1a0zRax7Ewv6W5mI9D5B9bKlgKbfVzb5FSAaA+zmZd75GJyfjDb9eZ+wuwM82Hl
         6joyyTMNZx7WK8f9qK563jc0E+VwMiEJxn9BZimbzj+69076snyyxpRSzulG1f19koDN
         U/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630703; x=1729235503;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BY9zGSxapKEse5IaWemdzA4VO+IFkn0GTLzBBm6O9N4=;
        b=u7UVijC0ATbJNrwQ91eIcdRTL159h7YczcYlt9PQnO+QFoWGZ1WFsXSImdEdWNI0Na
         4rM+14tdM0nt7o336IdbvsMxOgQNx7Kxyv1vjeg4na7kbqo/ySNn4e4jGtGGIb/+UiKy
         uEbV7iEc7G63FYJinYBugL1brPhMBNvY+orsaJhsYd9OrfQkR4fmFQUosodNfckQXDeF
         Hfdo+Uz5qWNZbiGv6HxTuvVbQDspIf5/FUdYEhPhetzSPKzThQj5wZjHIBtHWp0jciDH
         910cKCgfV1C+5o1LEJQcFx1Tv0aA7C5yv397bHhAW+Np3xRVb5EHq7ak4WsC+9iDyYjX
         PYvg==
X-Gm-Message-State: AOJu0YzPiFcXoiNo1VWkmFUOsxB32YqIOyXV1uTbN9bibM4SQ/+JHtJ1
	remRkMMuSXopqhDRc8/zYmcuXEtH7JSE5LlF3pVaCU3ByIm9YXhmTQtgbQ==
X-Google-Smtp-Source: AGHT+IGJ4hQN4qsmQ8on8G1xnhhzbEQppdQGcP4l36mdCJb193LM8+MOTnOI7zIC5j7tV7Xp1p8i1Q==
X-Received: by 2002:a17:907:6094:b0:a77:c30c:341 with SMTP id a640c23a62f3a-a99b8e8c123mr135554366b.0.1728630703270;
        Fri, 11 Oct 2024 00:11:43 -0700 (PDT)
Received: from [192.168.1.55] (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f2437csm178420166b.57.2024.10.11.00.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:11:42 -0700 (PDT)
Message-ID: <35a7073a94877ebc069601944a2fac1ddd578ecd.camel@gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH v3] lib/oe/package-manager:
 skip processing installed-pkgs with empty globs
From: claus.stovgaard@gmail.com
To: openembedded-core@lists.openembedded.org, Ross Burton
 <Ross.Burton@arm.com>
Date: Fri, 11 Oct 2024 09:11:41 +0200
In-Reply-To: <17FD33D222241C74.22523@lists.openembedded.org>
References: <20241007203946.684938-1-claus.stovgaard@gmail.com>
	 <17FD33D222241C74.22523@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 07:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205661

On Thu, 2024-10-10 at 23:13 +0200, Claus Stovgaard via
lists.openembedded.org wrote:
> 
> 
> Hi Ross.
> 
> Now you commented on v2 of the patch. Hope you think v3 is okay.
> 
> /Claus

Nevermind. I can see Richard har picked it up in OE-core and poky-
contrib.

/Claus


