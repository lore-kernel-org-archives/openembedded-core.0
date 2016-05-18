Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7998573216
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 19:38:33 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i7so5295288qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hi+eV3yWYFT+PhDH2XM9IUX8ETdokq36rLtPD0xsVFg=;
	b=zqoyDe2ZUdRyXxUiygZcI5+jWLZxWwMNeQVbUsL96mgeXYFL4qxt3YI2+XFXiSY8Qs
	G+nDNaaJC8RsKKlZ3q7jNt7L8uqkLtmd1lXZ0YogoEU1vxsNeXtMfQA5iaicA1VOkrG8
	SJaDaPQQmjBroeFOhGNxZYGtlD/CiGcpyuaPOq67lvaEI8AYWSuU5nWeotkBO4Ik6sIQ
	ZuG5uECueydLna5yKEhyUlzL/3WghuakSTyEkP6Coc5HRpvSHvWdMeZiwSXOTCKgXCQu
	ZzxJ/hqs9On0uINd4hW6gHMZ+Nu8y5ZWcWDQ+GuHF6p6YGBbPMZalYPUPrurBk/azsdL
	tjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hi+eV3yWYFT+PhDH2XM9IUX8ETdokq36rLtPD0xsVFg=;
	b=mEtg+3jxS1QNJILRR4lcoGGvLcjtFxiqkxekasETb27Gf5Z1uE/w4vTvNOkzoQxDZ3
	DSlw713nwuOKqYgG5VJ/5oVlPtsN+jPWRtW1ygX5RYIJQukbaOWzvi6UHY/VeaOu02Hu
	DR0CemJG1Zbz+2wUnIMhiw2+UNgluD/sEDwWHdpCRR5N1bQ6bJUqjWlvwvOiztaYg/N/
	1MY4IhRxGinIPWx7ZRXXpw/cWAifeQr3voSzWRbsSFZWsaKcwSjf9zM/K7blMZS18bQD
	hX6MRHBYwM+qXZBuPljoEClytlZF8G9H0Y+455K2Qs61OVGFToggWjqGsa0oAwLzVVZE
	RhuA==
X-Gm-Message-State: AOPr4FVOyCLngAlWpR0KvCSi32F1o4wovZQyQoATiUXdU0ae8pwwZg3iVUDTWwW2IKQavTrDCSSvUV1xcEwCGQ==
X-Received: by 10.233.239.210 with SMTP id d201mr10367715qkg.41.1463600314411; 
	Wed, 18 May 2016 12:38:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 18 May 2016 12:38:04 -0700 (PDT)
In-Reply-To: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
	<c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2016 12:38:04 -0700
Message-ID: <CAMKF1sqUdo1X0v1ET1_udjGb8-7pg8sucv5yZ3=PuYacvtGQwA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] useradd.bbclass: Strip trailing '; ' in cmd params
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
X-List-Received-Date: Wed, 18 May 2016 19:38:35 -0000
Content-Type: text/plain; charset=UTF-8

This fix was not sufficient and there has to be extra fix done to also
consider the case
when sysroot is created during image build time. I have updated it in
pull request here

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/pu&id=642c6cf0b6a0371de476513162bd0cefa9c438b3

On Tue, May 17, 2016 at 9:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> When there are more than 1 packages in a recipe requiring useradd
> services, they are concatnated and a ';' is inserted just after
> each of the users being added by the packages. A situation arises
> in cases where this is controlled by PACKAGECONFIG then we add a
> ';' separator in the USERADD_PARAM value itself for each packagecofig
> since we do not know which one will be picked, we end up in situation
> where the final string returned from get_all_cmd_params() appears to be
>
> a; ; b; c;
>
> and then the logic which uses these cmds triggers with ';' as separator
> but in this case it will fail after executing useradd 'a' because the next
> cmd it will call will be just a whitespace
>
> This is highlighted by the systemd patch to add more users as needed
> by systemd 229 components.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/useradd.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index ee402ac..ae27c01 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -203,7 +203,7 @@ def get_all_cmd_params(d, cmd_type):
>      for pkg in useradd_packages.split():
>          param = d.getVar(param_type % pkg, True)
>          if param:
> -            params.append(param)
> +            params.append(param.rstrip(" ;"))
>
>      return "; ".join(params)
>
> --
> 2.8.2
>

