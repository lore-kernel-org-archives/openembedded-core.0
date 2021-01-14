Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.1301.1610630858481746779
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 05:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AiMPmZPx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id v184so476443wma.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 05:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ZT3PTqDAjIMn7bkZGS9/Q7eMVWxqAdFEUpnbW6bw28k=;
        b=AiMPmZPx+F3dzep2c9Z6XGJ+B/0jUawmx5tk5Xil/UeBATeu8ByuZIaDRD36+E6YI3
         zRnF9dVnezcKdoUE2Y8z2dCQBn4T4Qn1aqX/MhlWRB5j6IWQ0cRAXG6PfNUQOfSagKAI
         6ivn2aGyOScF750bna7iM8ItHWpROd+LU/qGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZT3PTqDAjIMn7bkZGS9/Q7eMVWxqAdFEUpnbW6bw28k=;
        b=VtIogWNa7oK90MHvncWKRoJ53WSXY0e1CWJhMeqBTQl13I3FLE5WVfE4K8IalwNe6M
         HRQjtD9G4Z4iHNGqdFUPfkGuuoLERW7KhTA30Rp+yzsFGLvr3hmLa/TJOW753r43Oen9
         vWB88t1KAQTo70eYP0BdqAVBvz9H7W0WaOAYM3rMFOhVFyAv/SKiN+9W/nWLuz+67y4z
         ozSmLoiCodZ8q5FMSs5vBqCdi9wWleZt4kgXMfrWigNQitlpkb/aba9Qi3MR/IG9cYiO
         6vC8S8V+NeO2s6ZLrd1vgxJB2G4hz1jHjEQt3NeRUlivCt48+9fnubtTsDMo7Z9peycQ
         xj7w==
X-Gm-Message-State: AOAM530uaHW10XTQ1qtHX6tR3tMlzmv3s/axuzU75XtN2Er9sAwTbn6+
	js4jviJQAIwA7xODHh1Mo4fKeQ==
X-Google-Smtp-Source: ABdhPJxl3mzuJUGvEDRbK4zMEMs6Q1Pu4paSZfAhG1n0/kPwUYp9M1NvyHaoA4E9HSXQjmGq4qeg2w==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr3991953wmi.130.1610630856833;
        Thu, 14 Jan 2021 05:27:36 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b0e3:c052:eb93:5c3? ([2001:8b0:aba:5f3c:b0e3:c052:eb93:5c3])
        by smtp.gmail.com with ESMTPSA id o14sm8447764wmc.28.2021.01.14.05.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 05:27:36 -0800 (PST)
Message-ID: <ce613531685e040d039bceba3bad99bf60c5d7aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] classes: Introduce intermediate-deploy.bbclass
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2021 13:27:33 +0000
In-Reply-To: <AM6PR08MB3461D404A67176C477DE723E92A80@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
	<830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
	 <01f36254e19849396ad43d6eed745b178f2080fd.camel@linuxfoundation.org>
	 <AM6PR08MB3461D404A67176C477DE723E92A80@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-14 at 13:06 +0000, Diego Sueiro wrote:
> 
> Just trying to see if I got it right this time.
> Are you proposing to move `${D}/boot` to `${D}/intermediate-
> deploy/boot` and
> have SYSROOT_DIRS += "/intermediate-deploy "?

Yes.

> But, If it is just a copy having within ${D} , I'll have to have
> `PACKAGES_${PN} += "${PN}-intermediate-deploy"` and
> FILES_${PN}-intermediate-deploy = "/intermediate-deploy" to no fail
> with "installed-vs-shipped" in the package qa.

Or, we have perform_packagecopy() just delete/skip it. That would mean
it won't make it into the packages.

(we could also implement as a PACKAGE_PREPROCESS_FUNC but I'd probably
just add to the above function instead?)


> The way this class is implemented is just copying the dirs from $D
> listed in
> $INTERMEDIATE_DEPLOY_DIRS to the $SYSROOT_DESTDIR and can't use
> SYSROOT_DIRS
> variable directly because the sysroot_stage_all function copies from
> $D.
> 
> 
> > I'm not particularly liking the name. Maybe "unpackaged/boot" or
> > "non-
> > target/boot"? I'm open to ideas.
> > 
> > The idea is to make it really clear these are files which are not
> > part of the
> > target rootfs though...
> 
> I also don’t like this name either. Maybe "non-filesystem/boot"?

Maybe sysroot-only/boot/ ?

Cheers,

Richard

