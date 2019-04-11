Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3CCBB7D781
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:25:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y197so8241572wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=e4dv9Omh1FEyLmhlmUmfasTayk5qQqtY0Dsb4t1l48o=;
	b=Xf/ttQlx6YdgYdlfIPeUaGAYsry4haKO7w28Suz69ihDsFQbJBcfBPJF9tMz7CcG2O
	LxBFFFiL2dhqpH9BNo061axk/sEKXX3UBuo79Ratx+MP9tfeQvy7aeLQOdBzbmDiuluC
	8xD0csPfaEgAoEZIUe7dJF1X4SdtaQ1sZU/5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=e4dv9Omh1FEyLmhlmUmfasTayk5qQqtY0Dsb4t1l48o=;
	b=Q5qMeisplXG+Moidvp0VQQtuAGAxX964A2iNEGkJbILXiiYZ8rDbHytRliwTgGzh0P
	ePWiFgt0XA/OJX+yIWczAOYTBiD+sR3xQQv6+K4nl6VVT4FQi8fG2Iid5UxOZf7lKL3Y
	QdvKjcYG9zDA0bo9mQf5DTnTnBaXGxH3I5AqFFIdIoZhxDNl/2D9ymxoTMyccsuBR6vY
	PfKw+eFef24ltxwSp5LKvtaoVI9PlomotGe/4ulzJso8pbNz13ZS1BrwPrsa3RrnBFom
	eBmvF/p7jkf+C25PSr8vpePCdRhXtCQuBc9XRZwRRvvxKsACqt+3vAAa4dl020Aa+YAB
	6FVw==
X-Gm-Message-State: APjAAAVc9IQIzww0SiX8HpVcWYF5DgDQtO9btEJ3j47159ujJZy3EZKK
	CtgY4ILBtwxoC4I8NkuvCq3s2Q==
X-Google-Smtp-Source: APXvYqw4iIpR1UdiQw1sAcVFLM4W4pMlN7Xn1pXcHPzKETQZ2aOOk7/bH72WBxWJdquDLqAg9QHNWg==
X-Received: by 2002:a1c:1a46:: with SMTP id a67mr8245529wma.21.1555014305910; 
	Thu, 11 Apr 2019 13:25:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t74sm12962918wmt.3.2019.04.11.13.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 13:25:04 -0700 (PDT)
Message-ID: <9fa8d19084b46a9467a72873540e796230352ea5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 21:25:03 +0100
In-Reply-To: <2e971d062525b21d52a68d1926927f1a60af08d8.1548386264.git.Qi.Chen@windriver.com>
References: <cover.1548386264.git.Qi.Chen@windriver.com>
	<2e971d062525b21d52a68d1926927f1a60af08d8.1548386264.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] runqemu: do not check return code of tput
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
X-List-Received-Date: Thu, 11 Apr 2019 20:25:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-25 at 11:18 +0800, Chen Qi wrote:
> The subprocess.run was replaced by subprocess.check_call because
> of compatibility support down to python 3.4. But we really don't
> care about whether that command succeeds. Some user reports that
> in some tmux environment, this command fails and gives some
> unpleasant traceback output. So we use 'call' instead of 'check_call'
> to avoid such problem.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/runqemu | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c4a0ca8..d3239ee 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1318,7 +1318,7 @@ def main():
>              logger.info("SIGTERM received")
>              os.kill(config.qemupid, signal.SIGTERM)
>              config.cleanup()
> -            subprocess.check_call(["tput", "smam"])
> +            subprocess.call(["tput", "smam"])
>          signal.signal(signal.SIGTERM, sigterm_handler)
>  
>          config.check_args()
> @@ -1340,7 +1340,7 @@ def main():
>          return 1
>      finally:
>          config.cleanup()
> -        subprocess.check_call(["tput", "smam"])
> +        subprocess.call(["tput", "smam"])

Can you send a v2 with a comment saying we're ignoring errors
deliberately please? Otherwise someone will just "fix" this again.

Cheers,

Richard


