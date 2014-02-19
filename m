Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6066EE32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 20:20:17 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id bs8so1020192wib.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 12:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:date:message-id:in-reply-to:references:user-agent:subject
	:mime-version:content-type:content-transfer-encoding;
	bh=RGyqYlEYVQBcIuG/vOS04WN12TtjOd1y6g9dX1Qgj04=;
	b=djPZlbvEvxtV5aTzscD4u7Ep+lv3f0+1maOCO5q3BqonSqXQZc3XTQu4Q7L32xhNw1
	ZJsL7QDz/DqnWHamUU4pTFDMEaS9m4zKmAjx8IWsaX0VJCIgE0MxadneN/Xi3Ol3Qptt
	UMC8iSZkIkt9PtJmKCMEwlMrOPMfkMlpLJcaWJYHcOJq9LVgSVdMZZHBHRBDPVQ06uIU
	yDSkYbzSck6kRsJafeSouD78xM9SN/KuJjuBv3mbECv4DfUyjrTX6Bs8b897ktEPDe+l
	RDDZP5YS7TJfKeWJjUf+M5RB9SrdNmVqIXwfWygvKRsuhm2q6yRw797NZUu0/nX+iDa3
	Pt1A==
X-Received: by 10.14.203.197 with SMTP id f45mr5044778eeo.90.1392841217509;
	Wed, 19 Feb 2014 12:20:17 -0800 (PST)
Received: from [93.111.26.77] (093111026077.atmpu0041.highway.a1.net.
	[93.111.26.77])
	by mx.google.com with ESMTPSA id o45sm4722698eeb.18.2014.02.19.12.20.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 12:20:16 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 19 Feb 2014 21:20:19 +0100
Message-ID: <1444bce4c18.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1392799558-31118-1-git-send-email-koen.kooi@linaro.org>
References: <1392799558-31118-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.3.8 (build:
	2100414)
MIME-Version: 1.0
Subject: Re: [PATCH] openssh: enable PAM at runtime based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 19 Feb 2014 20:20:18 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 19 February 2014 09:46:12 Koen Kooi <koen.kooi@linaro.org> wrote:


> +++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
> @@ -82,6 +82,8 @@ do_install_append () {
>  	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" 
>  ]; then
>  		install -d ${D}${sysconfdir}/pam.d
>  		install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd

I'd rephrase the above to use one install -D and pass both files below to 
just one sed.

thanks,

> +		sed -i -e 's:#UsePAM no:UsePAM yes:' ${WORKDIR}/sshd_config
> +		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
>  	fi
>
>  	install -d ${D}${sysconfdir}/init.d
> --
> 1.8.4.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



Sent with AquaMail for Android
http://www.aqua-mail.com



