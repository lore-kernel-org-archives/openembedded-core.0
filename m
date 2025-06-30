Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4DBC83000
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 08:11:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.34378.1751271063552062947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 01:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NcV8Shd7;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55515213c3cso1376690e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751271061; x=1751875861; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gD16hLEDQ17V/7wroeABNohIGc0Bz1SgXlIHv69HMXc=;
        b=NcV8Shd7PIFYRNQRYh/zr58MGdR0XJloQmewXiHTUXP/QdzNQ7qiwDoz+Di+6Y5FFP
         R+Su6mkgnHqmpcSegerzQ0tI0Ub3LxB2T2ZLWWuq9MiHVLVu1BjCbE7C4hZrvgMRik2p
         iA2oBqQyEOSmywNlPSJpkaok23ilrmCjQH1RsMTtUSRyooW78tc+4NruL9K1sI593Qgd
         g+c6l/6zgpjW4v5GIrZVUaAe6JkhdKb6E1ew2v2Rg3AXqnp7dX1+E3qLFwgtrl1zUVVR
         kQ+sWmwQdEq9fnjGFccNewprBzwWqi/OuVPls7sVdud7AB2QkVlEAK0laomAb92QZkhU
         4WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271061; x=1751875861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gD16hLEDQ17V/7wroeABNohIGc0Bz1SgXlIHv69HMXc=;
        b=M3noM7jzcNmikYBm/wpzUKsWPvkEE3t3zlpRR4yLzyxp5KY+vHWauIlXKPeKKhBYn3
         IcXFamk8I0lRMrQY4BNN/cly2SCRersMkKSwnj7PkXx+Q/BLA+46tabC/ksttY5Wwi0w
         DOUTuiu0AAm0RzclZFK9ZBG/6rZNB1M0XxCApvE/9gI3gh91OmKulJkuK9xf9A0JY7sz
         OKfQ8Qz2iu6nx6k//yRCIJCNk0XY0jCUuMQ9gYqaAXNhBUCtm4vYk6nyeqOTTlL6bSM+
         reJTFpTjctsIwIbHyipjX080fCy5zpJRnFZI4h1DfDiCVD6J6caErsDJP5h0v+uH1OH9
         Nl0A==
X-Gm-Message-State: AOJu0YwR92IJUaw519COzN70ShMQR2Z+KlxP99U3xbxZkENMS2qJMmNB
	gAKXNKleAlQM4YxRkZFGFqrTyPbYMFG/OsO2+6ekgI4q1QoQZXh7f+oWDZtMwZE9J8w=
X-Gm-Gg: ASbGncvQG3LI8nf3WSX2X1qp9LCAvOJ9atX7kD9Qq/+bJGmuhw1mpaaqzp/B39y9Edp
	H2cvuaw2J6XYHTJQqXohYMOHCj+fO6Rfx2J7G3n6HevAGjRIZMFrYPSi5DsJrwju7RIfbgYD2PW
	ly1rfaXwQjTLAibK4i9/YoE/5FogIka9xmR1EUa+PXlCRE/1llBzIqR7sGW+zzA1OAHHfPyVR1C
	oljixB5xQSKoS1SatOb9te4+Nlc3NbLcjI1zK0Ywewz0OsnKou7Yn5Q4cCBUXLfGq27xHCw/W6U
	6q5EZtidnHACMGnukLcwPJ9xVtEFUO16oGfEEti1wDY4WRavQCGX6CrjgDbgr8OlKXtyxQzDwBc
	rjgejuGmDW58isTGOCAMM72XzI4uluw==
X-Google-Smtp-Source: AGHT+IFaxNN9vzOoE/HvYbHGCb8aAe+csxz83Mriv4Hi0csSNnaYv3xAgZ//u4LmforSuTlFpZouqw==
X-Received: by 2002:a05:6512:15a9:b0:553:a32a:6c2 with SMTP id 2adb3069b0e04-5550b7ec35emr4008419e87.6.1751271061369;
        Mon, 30 Jun 2025 01:11:01 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce7d9sm1325277e87.176.2025.06.30.01.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:11:01 -0700 (PDT)
Date: Mon, 30 Jun 2025 11:10:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/6] testexport.bbclass oe-test: capture tests
 and data from all layers
Message-ID: <aGJGk-Zwz44suRRx@nuoska>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
 <20250627063004.781560-5-mikko.rapeli@linaro.org>
 <85be83126120136b7892d5bfe1ab80e78999f030.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85be83126120136b7892d5bfe1ab80e78999f030.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219456

Hi,

On Sun, Jun 29, 2025 at 08:05:35AM +0100, Richard Purdie wrote:
> On Fri, 2025-06-27 at 09:30 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > testexport.bbclass only copied files from core layer to
> > the testexport.tar.gz to run tests. Then it removed
> > all tests and files which were not specified in
> > TEST_SUITES variable.
> > 
> > Stop removing files to include for example parselogs.py
> > test data files which are machine and/or layer specific.
> > TEST_SUITES variable is now read from build time exported
> > data store when running tests.
> > 
> > Then copy oeqa runtime files from all layers so that tests and
> > test data like parselogs ignore files will be provided
> > to testexport.tar.gz.
> > 
> > Adapt oe-test script to find "lib" directories from
> > the new structure with layer specific paths.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/classes-recipe/testexport.bbclass | 43 +++++++++++++-------------
> > �scripts/oe-test����������������������� | 12 ++++---
> > �2 files changed, 30 insertions(+), 25 deletions(-)
> 
> The patch does things which aren't really spelt out in the commit
> message. This change removes the target specific filtering, putting all
> tests into the output and not just the ones applicable to the target in
> question.

Sorry, tried to describe this but failed. Yes, all tests are now exported,
also the ones not needed by the current image target because the TEST_SUITES
variable is read from exported data at test run time.
 
> Once you do that, "testexport" may as well be a script rather than a
> task as it is no longer target specific.

For the test python files and data, yes, but not for the data file
which actually describes what tests to run.

> As I've said elsewhere, I'm not against doing it but the commit message
> should be clear, and it does raise the question of whether we just jump
> to that external script and remove this class?

We still need to export the per-image manifest and testdata. If those
are exported elsewhere, then these all could be an external script to
create a tar ball to run the configured tests.

Cheers,

-Mikko

