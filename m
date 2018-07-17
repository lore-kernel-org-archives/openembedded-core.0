Return-Path: <rv@rasmusvillemoes.dk>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9985D71957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 08:14:59 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id m13-v6so173299lfb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rasmusvillemoes.dk; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=3Rvst5FPiryBM3Iu+gmCLT1DOgNc8z4g05pD8lpUFIk=;
	b=ijGEQY7P69GsGQ1ybRVkCU3W0i9mliY6euxhTLFmmxn6IxVPS/xxLL1sEhnkHTtJ7/
	rAIKKlEsKBNNRpg5j3fmYY846idCYvvXSSI57NKARZIdatGxWEFnxZiXnd/w7IW/bkTL
	3+fP/5+EQo0JZMECYbxAAAJi9iCPCjSv9REZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3Rvst5FPiryBM3Iu+gmCLT1DOgNc8z4g05pD8lpUFIk=;
	b=RE816H8mSNN1IrDJn/UlFlRqZfcxg7KmXmQrRhFh6N8RFWqYk+sPYwjZn/SDbkN8zv
	dNlcrzrsneGquFxBuyzYNambz1nGEOM4+hZgMMQy7djCWPLaX+vkf1nrxMQ3Dlj6807K
	YQJ8cU+SOyorM+Qo4FQmyZ+j4DIaP4Pl3XxCRolVBC3A+agm/rlLWB4xc0R1VQPcjy5t
	opRq+2XJl46Z3+h/qBWq3R1c0e4NCp2fyaai8c8A30kCQamGFDzxPDx+N6mO63LDpA3P
	jGRamiIfsCthSX+yq517DUtLWGzJPXNQjZNwrIHnWZQRoTTRO/5vbKukYfmPdwg1DdPk
	HYYg==
X-Gm-Message-State: AOUpUlHQLl0J06E6uQS7GUgqH0uTPHXxi2xyWMFHzu/eUXVpBZEyN3vz
	45nhP0gEc9P9t0jAhuCpOf7AodeFEUU=
X-Google-Smtp-Source: AAOMgpfDicdnRsS+utu/sjZzgQmQh72j1CCTQ1NNl/EeEJlngKy94XKRGu/MELE6oOKSd0EwQBhsZg==
X-Received: by 2002:a19:c301:: with SMTP id t1-v6mr524115lff.45.1531815299967; 
	Tue, 17 Jul 2018 01:14:59 -0700 (PDT)
Received: from [172.16.11.32] ([81.216.59.226])
	by smtp.gmail.com with ESMTPSA id
	x8-v6sm68579lji.53.2018.07.17.01.14.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 01:14:59 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
	<20180703125414.28470-1-rasmus.villemoes@prevas.dk>
From: Rasmus Villemoes <rv@rasmusvillemoes.dk>
Message-ID: <0f5db42f-5fc6-cbce-2c60-f869a4f264b4@rasmusvillemoes.dk>
Date: Tue, 17 Jul 2018 10:14:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180703125414.28470-1-rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH resend] wic: allow bitbake variables in kickstarter files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 08:15:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-07-03 14:54, Rasmus Villemoes wrote:
> image_types_wic.bbclass has a mechanism for doing variable substitution
> on .wks files by simply letting the input file be called
> .wks.in. However, that doesn't allow using variables in files included
> via the include directive. This is unfortunate, because lacking either
> the ability to include other files or variable substitution leads to
> fragile and error-prone duplication between kickstarter files and
> recipes/configuration files used for various boards.
> 
> This adds (somewhat naive) support for variable substitution in all
> files parsed by wic. The user should add all required variables to
> WICVARS to get them exported appropriately.

ping^n

