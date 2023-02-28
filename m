Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F540C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 07:06:47 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.17799.1677567996633285497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 23:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ylsaacIa;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id s22so11843638lfi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 23:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKSDqSDTv6D/JOi058Wlqf9aESYPFieZDOTRID6UwQ4=;
        b=ylsaacIa5TeRLjXMkAHcM6Mxxbq3ttdbu0vUduuE9tm9vcBSLl0IWXIEOEthNLZ3Gq
         Eb8HUP6TBhSmFrg8qefZvEUmjsik8zmemmpj+rfEn4BUOjkuhLshxqGt3XAlul+pNlpR
         Ni7HS+cufK9140Y9CtLn8cpfEcUPEJhWbZjjYVNdNDH6qKcDtKkmX6HIBZDgyHZouWoj
         VXJ4sUZs0jXv98W0EY3Onq73BOp5mQXdYeM7HJtQLVAXfMeh5qRAPJ/bCGGAMIn7FHjH
         4knEIMThuKa3M3M7Hv0YNSjiPbldhJlbRXK9Q4jLj4Z/ZVDNZ7ksgB4uPOLi5+MxSnN+
         R45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKSDqSDTv6D/JOi058Wlqf9aESYPFieZDOTRID6UwQ4=;
        b=nqD664K52qVsq+gMXgYchi5bAlYsja+t8gdoSIewxO1ocWnZPlZeJJJhMLG+9f6WfL
         v+f3BLL5ApQ4c+FoXebA7Jx9H/UnQGmMQKMoNtykfSQ6rZtR16U3uzQniVf5nKoW9KSC
         SXhpaFYYRiFGzXUuJfgpOVw0hCZbPj/XpzbEGfp4NGZkCKaf6rwSTLc8DWoiNfMldUj5
         Wi3lwJfEEE6XJLvkRtw9MXodhXLSZtkPDsbwOE0KVo+ARoa4cZJre/73KKWri4JYafuz
         lBnF/8qe5+QXlveqWWLCalG2s/krKUGktV9fF38v/6VdpaLwN9VrftbK3wFMYDEEasPi
         qyEw==
X-Gm-Message-State: AO0yUKV550KKyc0kC2ZtOAtsG8SZYkCk3kKdT3QdUNJs3vR77z+JBeOE
	iwwY1LDA4j9Xu/BXuYCcEqYhxg==
X-Google-Smtp-Source: AK7set8e4mrlQdavPeAX3HP91u2vVbS8crTHjS2HPof1HeeKQpSWsWrLOH4qNLoNHpMOK/8GwpZqlw==
X-Received: by 2002:ac2:5e8f:0:b0:4de:21c9:8a37 with SMTP id b15-20020ac25e8f000000b004de21c98a37mr504936lfq.1.1677567994605;
        Mon, 27 Feb 2023 23:06:34 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id t6-20020ac243a6000000b004cb430b5b38sm1219586lfl.185.2023.02.27.23.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 23:06:34 -0800 (PST)
Date: Tue, 28 Feb 2023 09:06:18 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Bryan Evenson <bevenson@melinkcorp.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] multiconfig: Build breaks parsing recipes for other
 config layer
Message-ID: <Y/2n6pDarv1huAUT@nuoska>
References: <CH0PR20MB4122DCF26110929D2A178451BBAF9@CH0PR20MB4122.namprd20.prod.outlook.com>
 <fb887f22-01c3-e202-18f4-f0c499c4d3d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb887f22-01c3-e202-18f4-f0c499c4d3d1@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177822

Hi,

On Mon, Feb 27, 2023 at 03:03:48PM -0600, Joshua Watt wrote:
> 
> On 2/27/23 14:35, Bryan Evenson wrote:
> > I'm testing a new board with a BSP that is setup on the gatesgarth branch.  I've been able to build and load the demo images for this board.  I'm now trying to use multiconfig to build images for my old board and my new board.  So far the build hasn't got past parsing recipes and I'm wondering what I'm doing wrong.
> > 
> > For my setup, I have two separate layers for the two different boards.  Each layer has its own MACHINE and DISTRO definitions.  I setup the multiconfig files as follows:
> > 
> > conf/local.conf:
> > Added the following line:
> > BBMULTICONFIG = "configA configB"
> > 
> > conf/multiconfig/configA.conf: (config for old board)
> > MACHINE = "machineA"
> > TMPDIR = "${TOPDIR}/tmpConfigA"
> > DISTRO = "distroA"
> > 
> > conf/multiconfig/configB.conf: (config for new board)
> > MACHINE = "machineB"
> > TMPDIR = "${TOPDIR}/tmpConfigB"
> > DISTRO = "distroB"
> > 
> > If I try building the old image by doing:
> > bitbake mc:configA:image-nameA
> > 
> > I get errors while parsing the files.  It complains about a Network Manager bbappend in layer B that uses variables that depends on MACHINE being set to "machineB".  The image for configA does not use Network Manager.  I also tried removing the MACHINE and DISTRO settings from local.conf to make sure the multiconfig settings are used, but then I get an error that MACHINE has not been set.
> > 
> > Does layerB need something added to it so parsing ignores recipes in this layer when they aren't needed?  Or do the recipes need to change so they build for other machines?
> 
> When you use multiconfig, all of you layers need to parse for all
> configurations (although this is generally good layer practice in general,
> not just when using multiconfig). Usually this involves writing the recipes
> to use overrides where appropriate
> 
> 
> Although, if you _really_ don't want to do that, the BBMASK variable
> (https://docs.yoctoproject.org/ref-manual/variables.html#term-BBMASK) can
> now be set per-multiconfig so you can have layerA mask out layerB recipes
> and vice-versa.

Another way to have distro, machine, version etc specific bbappends and recipes in
layers is to use DISTRO, MACHINE, DISTRO_CODENAME etc variables in
BBFILES path. Example layer.conf:

BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
            ${LAYERDIR}/recipes-*/*/*.bbappend \
            ${LAYERDIR}/${DISTRO_CODENAME}-recipes-*/*/*.bb \
            ${LAYERDIR}/${DISTRO_CODENAME}-recipes-*/*/*.bbappend \
"

Then the layer can have kirkstone-recipes* and mickledore-recipes*
directories for bbappends specific to those branches. This enables
supporting multiple poky/yocto major versions from a single meta layer
branch without having recipe version specific bbappends which cause
problems when there are no recipes matching those versions. Same
approach will work with DISTRO, MACHINE and other variables.

Cheers,

-Mikko

