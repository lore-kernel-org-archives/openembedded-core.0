Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1057CF1B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:49:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 30so11425284wrk.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=UnOTXw7Ih55WGJAPLp1XWJMo84Oii3E07Jy0q1nwowA=;
	b=TIksE1zRPkMu9tXIrOdllCJjZ9Bpb0kXqLKu38NEAiFdtOIjVxzpd3FjSZwV/9UeBZ
	Fa+hvzBCen5Huwv4ktGW4o5RFjWLMq4lvT8qDzFDSdy4a8/dL0Pr6C00kDWUYnTWQ7SA
	DLPe9bZXeP2NQqwNQ6e7wUdO2IRto22KHOHvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UnOTXw7Ih55WGJAPLp1XWJMo84Oii3E07Jy0q1nwowA=;
	b=azlSpwVvzgkxEFkBLfJvw5vJ76wKy+ATXpVQpNHnkeTmKoc9L1WqekmIOBZ/NeLGwL
	lukahoGfyIEG7LCuZVFi8CLldJSpG/DQk7EQECPn1H09igZSQZcWNTXeod3DH9qrUfhu
	QtKniDTCByddUwrSvuMN/hAV5dtB7cF+qf+drilsjoExJeNZYo6CMHu6NvgBoSgLm/QV
	/LV8AaVFSx7Px76lOHcqwFyPzolDK+KDOq7fMW4wt276jUaAsA2KGhhqk8JBovrKDFbg
	5N3wwAbURQ7MQ4x2781JTv0St5yuFeF/87HX7vFctsFOTUOwsmvZF6Z4iBZDKsOXbc0P
	T2ZQ==
X-Gm-Message-State: APjAAAVboaGxXePOagMYfhEdaC0h2Z2QdGiVP46ns13wZjLydS6JrLmP
	GitPo5jVLxhVyUUGBiL7NS6D8w==
X-Google-Smtp-Source: APXvYqz95oUilNZ0YSW2k/AbRoAuImoM9qqVaA/HBQHy7cesofExEZ4b160l/mOxLXcRbZg8OHNf2g==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr35970680wrv.248.1567622960918;
	Wed, 04 Sep 2019 11:49:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y3sm3904192wra.88.2019.09.04.11.49.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 11:49:20 -0700 (PDT)
Message-ID: <9c7b636db80cad1b2d9a29b287d1e0500aadf668.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 04 Sep 2019 19:49:19 +0100
In-Reply-To: <20190904181009.8374-1-raj.khem@gmail.com>
References: <20190904181009.8374-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] python3: Expose PYTHON_BINABI in global config metadata
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
X-List-Received-Date: Wed, 04 Sep 2019 18:49:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-09-04 at 11:10 -0700, Khem Raj wrote:
> packages can use
> 
> find_package(PythonInterp REQUIRED)
> find_package(PythonLibs REQUIRED)
> 
> while we control PYTHON pointing to native py3 the libs and include
> directories will then point to build host version, which can result
> in
> unexpected combination and if we are lucky we get errors if its quite
> different e.g. py2 libs/includes and py3 executable
> 
> This variable can be then used to export PYTHON_LIBRARY and
> PYTHON_INCLUDE_DIR so that above find_packages can work correctly
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   | 3 +++
>  meta/recipes-devtools/python/python3_3.7.4.bb | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)

Putting this into the global namespace seems like a really bad idea.
Can we not use a class like Alex mentions? I thought we already had
one?

Cheers,

Richard


