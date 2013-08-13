Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B43B6B40D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 16:08:21 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id x7so4391011qeu.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uD4zJr7/E+4GnKtvO+Knwh99EsB14vjXWOBEgWpqVW4=;
	b=d5hZpdi8XgWLmGoWC8PxVy0gRIzn7xkWY4+u8RziG8x5/vX+8wh3SDfGkCYx3KWPoj
	GnFfY+5HuxlQgLC3u9MiZkUlMX0gVqOxw0yuQIebagkN0IHdMyD5ROv1gfl5ebaJmUIu
	qHJ8iZilcFMoBu7TBY5Gc2IFYYn/ASeWkoU1fTmyyFtID5Gp9g+X3eYpiL4vJ3v4o7oL
	5fPs750znegfI60+om3Soi27SR8JCRh8AMG1XuF1F5Cauleas4at1NpucolhY4y9y55E
	6W9+ahi99Wyg9wjXBmpHthTm1xSrScz0e1fn01ue7xAp+knhKaVGM0DJjbJPk7SqNr7N
	FU2g==
MIME-Version: 1.0
X-Received: by 10.224.134.194 with SMTP id k2mr5458470qat.50.1376410101521;
	Tue, 13 Aug 2013 09:08:21 -0700 (PDT)
Received: by 10.49.108.39 with HTTP; Tue, 13 Aug 2013 09:08:21 -0700 (PDT)
In-Reply-To: <520A512F.3060108@linux.intel.com>
References: <1376393206-14191-1-git-send-email-kirgene@gmail.com>
	<520A512F.3060108@linux.intel.com>
Date: Tue, 13 Aug 2013 19:08:21 +0300
Message-ID: <CADV-EXFeOZB=fuEdwyAShYTrGx0mpS+qr0TK291sPgEFi=Ha=A@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: fix systemd support for connman-* packages.
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
X-List-Received-Date: Tue, 13 Aug 2013 16:08:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/8/13 Saul Wold <sgw@linux.intel.com>:
> On 08/13/2013 04:26 AM, Yevhen Kyriukha wrote:
>>
>> This patch fixes systemd's postinst/postrm script generation.
>>
>> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
>> ---
>>   meta/recipes-connectivity/connman/connman.inc | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/connman/connman.inc
>> b/meta/recipes-connectivity/connman/connman.inc
>> index 6b5ea0b..37ce3ec 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -56,6 +56,14 @@ PACKAGECONFIG[wispr] =
>> "--enable-wispr,--disable-wispr,gnutls,"
>>   INITSCRIPT_NAME = "connman"
>>   INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
>>
>> +python __anonymous () {
>> +    systemd_packages = "${PN}"
>> +    pkgconfig = d.getVar('PACKAGECONFIG', True)
>> +    if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
>> +        systemd_packages += " ${PN}-vpn"
>> +    d.setVar('SYSTEMD_PACKAGES', systemd_packages)
>> +}
>> +
>>   SYSTEMD_SERVICE_${PN} = "connman.service"
>>   SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
>>   SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>>
> Can't you use the base_contains style of anon python in the
> SYSTEMD_PACKAGES:
>
> SYSTEMD_PACKAGES = "${PN} ${@base_contains('PACKAGECONFIG', 'vpn',
> '${PN}-vpn', '', d)}"
>
> Or can any one of those in the list above trigger the vpn, it would be
> cleaner if we just trigger on just one item.
>
> Sau!

Here is how connman detects (in configure.ac) whether to build
connman-vpn or not:
AM_CONDITIONAL(VPN, test "${enable_openconnect}" != "no" -o \
                        "${enable_openvpn}" != "no" -o \
                        "${enable_vpnc}" != "no" -o \
                        "${enable_l2tp}" != "no" -o \
                        "${enable_pptp}" != "no")

This patch is doing the same check: if at least one of VPN
technologies were selected we should build connman-vpn.

base_contains is not an option in this case as it checks whether
environment variable contains all strings that you provide in second
parameter.

Regards,
Yevhen

