Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 17FF96F7BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:08:38 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id cc10so3548271wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 02:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=RS2tdJRMnpycZnow2uEJcbi9l0EAyI3lKQvZc+fUBh4=;
	b=Onmg8F10dpH9oITmC0+rsGoEJcN7vkaUNJPZGyN+531eG2OOkYHyD4QCNeh6ezRya6
	Oinz6aKofsX+x49pRjFEJOimdXt5S4v9iFJGD2WPYLxQR1vlnSl3Nqa4H3uMhwxXnJ+Y
	l17GbYql3kyFoNBxplpyvfrLNWOGj2Jl+43vscMMi5uYga1CxiNvfvMu8n58Dcfsd0dx
	AzRus56b5bgNSpQiqMY3JUtnKvlCZlaoCHLcDiuBkffQcfpSl2TBbsWbNHbHsX/0nshz
	q/TX+cJqZpTq0JvcUvbjXKVjQgnPYIXPH00WqPSWPb2S3G/w/0+5cyTfIgb6BWX1qx9q
	KT+A==
X-Gm-Message-State: ALoCoQmKr17Sy7jsLt7RNrLwPpFL9Db5TOEGhQ8NryIV222rOCu4zc3miXAimqOfiaezIZETwNXV
X-Received: by 10.194.81.164 with SMTP id b4mr747597wjy.2.1394701718924;
	Thu, 13 Mar 2014 02:08:38 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id fo6sm5597834wib.7.2014.03.13.02.08.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Mar 2014 02:08:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52DE6FEA.5070300@linaro.org>
Date: Thu, 13 Mar 2014 10:09:21 +0100
Message-Id: <FA39033B-6625-4625-A550-8A55B5D70FBE@dominion.thruhere.net>
References: <1390302081-29499-1-git-send-email-koen.kooi@linaro.org>
	<20140121130110.GC4100@jama> <52DE6FEA.5070300@linaro.org>
To: Koen Kooi <koen.kooi@linaro.org>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
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
X-List-Received-Date: Thu, 13 Mar 2014 09:08:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 21 jan. 2014, om 14:02 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:

> On 01/21/2014 02:01 PM, Martin Jansa wrote:
>> On Tue, Jan 21, 2014 at 12:01:21PM +0100, Koen Kooi wrote:
>>> From: Koen Kooi <koen@dominion.thruhere.net>
>>>=20
>>> Apps testing for systemd config get confused when both =
/usr/lib/systemd and /lib/systemd exist. This fixes (among other things) =
dracut systemd detections.
>>>=20
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>>  meta/recipes-core/systemd/systemd_208.bb | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>=20
>>> diff --git a/meta/recipes-core/systemd/systemd_208.bb =
b/meta/recipes-core/systemd/systemd_208.bb
>>> index 6590235..710624c 100644
>>> --- a/meta/recipes-core/systemd/systemd_208.bb
>>> +++ b/meta/recipes-core/systemd/systemd_208.bb
>>> @@ -113,6 +113,12 @@ do_install() {
>>>=20
>>>          # Delete journal README, as log can be symlinked inside =
volatile.
>>>          rm -f ${D}/${localstatedir}/log/README
>>> +
>>> +	# fix up libdir confusion
>>> +	if [ -d ${D}${libdir}/systemd ] ; then
>>> +		cp -a ${D}${libdir}/systemd/* ${D}${systemd_unitdir}
>>> +		rm -rf ${D}${libdir}/systemd
>>> +	fi
>>=20
>> It's not your fault, but the indentation looks inconsistent with rest =
of
>> do_install()
>=20
> And I did especially pay attention to use tabs after all the meta-oe =
patches I did :)

Ping


