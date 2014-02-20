Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2B54E6EFF8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 06:51:27 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so1408280wib.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 22:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=3miPVQumykx/fRrzKtitPMA876zf/sONqSBpU1foNqA=;
	b=TwCQ2DJ42gajGXp7dARzDU7/wjJ85ksw0Y5Ndd0N6HPT/2/Yojtej0CgI0mYUuTbeg
	lhbM0cPn1eVEg+TWfLpYMfqGyl+ZtSuuE0ONlz6di2SFn1Ps1isPStU+PXfN+XDWfeOw
	2X9Y8Psmk5uByI8WOXV3pTRGhEpEfeeS0vz8PNX44sSA1jpQJwE3V7pDFbMFu4Wv50+V
	AUqqns5L9xTITPO12Fg+Qefx5fP072jd1xTuUwQbWIGS7TKPRmshQiU2bqALJz0Sw6Vg
	cwjECLS2r+qLFcP0/L/kbs0LBS+8AQTQNEHDMXlC/FHFgIIhnpkdC6BlQMi/GzjjZz2B
	nOSA==
X-Gm-Message-State: ALoCoQmW+Sg25Rc9+US8/RebRY3C5tJMrISYFn1ig32LFZrA9SDhA+yfM01MZa8NV6Cw7hpbX/9S
X-Received: by 10.180.12.14 with SMTP id u14mr5446037wib.0.1392879087635;
	Wed, 19 Feb 2014 22:51:27 -0800 (PST)
Received: from ?IPv6:2001:610:612::c69:26e9:6518:4aa6?
	([2001:610:612:0:c69:26e9:6518:4aa6])
	by mx.google.com with ESMTPSA id j9sm6463061wjz.13.2014.02.19.22.51.26
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 22:51:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <530529CA.6000204@opendreambox.org>
Date: Thu, 20 Feb 2014 07:51:25 +0100
Message-Id: <2B24AE58-6D97-48CF-BE81-D05B8EB05B16@dominion.thruhere.net>
References: <1392799558-31118-1-git-send-email-koen.kooi@linaro.org>
	<530529CA.6000204@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Feb 2014 06:51:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 feb. 2014, om 23:01 heeft Andreas Oberritter =
<obi@opendreambox.org> het volgende geschreven:

> Hello Koen,
>=20
> On 19.02.2014 09:45, Koen Kooi wrote:
>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb =
b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
>> index 9c0bb48..5b9ec10 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
>> @@ -82,6 +82,8 @@ do_install_append () {
>> 	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" =
=3D "pam" ]; then
>> 		install -d ${D}${sysconfdir}/pam.d
>> 		install -m 0755 ${WORKDIR}/sshd =
${D}${sysconfdir}/pam.d/sshd
>> +		sed -i -e 's:#UsePAM no:UsePAM yes:' =
${WORKDIR}/sshd_config
>> +		sed -i -e 's:#UsePAM no:UsePAM yes:' =
${D}${sysconfdir}/ssh/sshd_config
>=20
> is the first of the two new lines really necessary?

Yes, the recipe installs /etc/ssh/sshd_config in do_compile_append and  =
/etc/ssh/sshd_config_readonly in do_install_append.

regards,

Koen

>=20
> Regards,
> Andreas
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


