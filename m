Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 685DC7D5A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 20:50:23 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id o25so913547wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=zbYv4zZhj8/q4xC9Yae6/FXG0j3PcUzKZMY6qCXYALE=;
	b=Kw2IYN3q4Q3FaysyNoEKXGmr2Kojb1KhHfnr6bW+/yl5eHmX1ovb9x3UQKVlpmDlKR
	NTi0UgEmp3P1+ZTXJJIqUt1a/EOEvyCnO94WthY4C3K8yLJ9u2W/DsMPuIs1dXqu7UOB
	gW2ZijHrqC0bi1476VrIzlF/lY8sUSeFUG7Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zbYv4zZhj8/q4xC9Yae6/FXG0j3PcUzKZMY6qCXYALE=;
	b=BXQlSruwTul4vrxgLj8D+kzFtTavy8vXSwMGF5bHtgo96TR4YtEYUEBaBGguILMtws
	vgAx68D9y9sbrwNr7EFAotvmebxg3w18dN4Qu8iwRaOVO8EpVODuQTTWRWrTcaa1at2O
	dkjyIlKvsuRm+R5bxs3nrksp0fJJ9QDANkSzPgu9r+N61dAt/jbr8C22e717zRa7gJ/M
	tE5aDMAMxgEDKqmLcxhI8UtbhrmC4g1V8epq+cerNCfFaqAtvYXIC+lUneFfOwAr3XAq
	P0VoHtN78hDr0sshfkfLIaRD5MDZWWVCs9e4BITaqRXmdy0iMIVlcX3LgIzsTDPZPeSq
	tR+g==
X-Gm-Message-State: APjAAAXDJkDtJ6Qnt1O04olOP+tMbykvKXHO17tWggLd2uyg9rh3zFsT
	ryC6X3f452IG2JQH/fvkWFKI7w==
X-Google-Smtp-Source: APXvYqyS7FEI3BPMEVvmhp6wBDZajQxxfqRJe0pbG9nGJyQBS7/ERwNp8lmMpdqKdMWBjgqYlaaGuQ==
X-Received: by 2002:a7b:c5c4:: with SMTP id n4mr911043wmk.151.1556225423978;
	Thu, 25 Apr 2019 13:50:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o6sm45879926wre.60.2019.04.25.13.50.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Apr 2019 13:50:22 -0700 (PDT)
Message-ID: <72e102b7e2a14c0747e3b485a6429f8dde546508.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jaewon Lee <jaewon.lee@xilinx.com>, 
	openembedded-core@lists.openembedded.org, manjukum@xilinx.com, 
	alejandr@xilinx.com
Date: Thu, 25 Apr 2019 21:50:21 +0100
In-Reply-To: <1556222193-2780-1-git-send-email-jaewon.lee@xilinx.com>
References: <1556222193-2780-1-git-send-email-jaewon.lee@xilinx.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [master][RFC] Adding back wrapper and using OEPYTHON3HOME variable for python3
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
X-List-Received-Date: Thu, 25 Apr 2019 20:50:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-25 at 12:56 -0700, Jaewon Lee wrote:
> +diff --git a/Modules/main.c b/Modules/main.c
> +index a745381..25ca435 100644
> +--- a/Modules/main.c
> ++++ b/Modules/main.c
> +@@ -1857,6 +1857,11 @@ config_init_home(_PyCoreConfig *config)
> +     }
> + 
> +     int res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
> ++
> ++    const char *oepython3home = config_get_env_var("OEPYTHON3HOME");
> ++    if (oepython3home) {
> ++        res = config_get_env_var_dup(&home, L"OEPYTHON3HOME", "OEPYTHON3HOME");
> ++    }
> +     if (res < 0) {
> +         return DECODE_LOCALE_ERR("PYTHONHOME", res);
> +     }
> +-- 
> +2.7.4

I think the above will leak memory.

Instead I think the code should be something like:

int res;
const char *oepython3home = config_get_env_var("OEPYTHON3HOME");
if (oepython3home) {
    res = config_get_env_var_dup(&home, L"OEPYTHON3HOME", "OEPYTHON3HOME");
    if (res < 0)
        return DECODE_LOCALE_ERR("OEPYTHON3HOME", res);
} else {
    res = config_get_env_var_dup(&home, L"PYTHONHOME", "PYTHONHOME");
    if (res < 0)
        return DECODE_LOCALE_ERR("PYTHONHOME", res);
}

and then a copy of PYTHONHOME isn't created in the OEPYTHON3HOME case.

Cheers,

Richard


