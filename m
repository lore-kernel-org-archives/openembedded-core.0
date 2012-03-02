Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S3PgQ-0004ga-Qp
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 11:25:54 +0100
Received: by wibhq12 with SMTP id hq12so537827wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 02:17:24 -0800 (PST)
Received: by 10.180.93.232 with SMTP id cx8mr3002825wib.14.1330683443749;
	Fri, 02 Mar 2012 02:17:23 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fb2sm2482014wid.3.2012.03.02.02.17.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 02:17:22 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F509DDF.3040103@windriver.com>
Date: Fri, 2 Mar 2012 11:17:20 +0100
Message-Id: <CC3FEF16-5F44-40D9-9A4D-A9C4ADADEF19@dominion.thruhere.net>
References: <cover.1330670625.git.liezhi.yang@windriver.com>
	<faf86eef0c803de04cb1a23041cce959a34ecee5.1330670625.git.liezhi.yang@windriver.com>
	<3F8819B5-BFD1-4A1B-AB0E-B54829635281@dominion.thruhere.net>
	<4F509DDF.3040103@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkRhaV3RFguHXftJv7D5rbl3xV8locS4MoCq+U9zjlFevQ+bp+SY6cr6gVTxHMz8Bpj30f8
Subject: Re: [PATCH 1/1] Fix libpam's chmod
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 10:25:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt. 2012, om 11:15 heeft Robert Yang het volgende geschreven:

>=20
>=20
> On 03/02/2012 04:42 PM, Koen Kooi wrote:
>>=20
>> Op 2 mrt. 2012, om 08:02 heeft Robert Yang het volgende geschreven:
>>=20
>>> The libpam's has an error when generating the rootfs:
>>>=20
>>> chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or =
directory
>>>=20
>>> This is because the following code in libpam_1.1.5.bb:
>>>=20
>>> pkg_postinst_pam-plugin-unix () {
>>>    # below is necessary to allow unix_chkpwd get user info from =
shadow file
>>>    # on lsb images
>>>    chmod 4755 ${sbindir}/unix_chkpwd
>>> }
>>>=20
>>> This is to set the setuid permission for unix_chkpwd (the lsb test
>>> requires this), but it lacks a "${D}", and we can do this in the =
install
>>> stage.
>>>=20
>>> [YOCTO #2049]
>>>=20
>>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>>> ---
>>> meta/recipes-extended/pam/libpam_1.1.5.bb |    7 ++-----
>>> 1 files changed, 2 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb =
b/meta/recipes-extended/pam/libpam_1.1.5.bb
>>> index 283f477..8cddca9 100644
>>> --- a/meta/recipes-extended/pam/libpam_1.1.5.bb
>>> +++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
>>> @@ -85,10 +85,7 @@ do_install() {
>>>=20
>>> 	install -d ${D}${sysconfdir}/pam.d/
>>> 	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
>>> -}
>>>=20
>>> -pkg_postinst_pam-plugin-unix () {
>>> -    # below is necessary to allow unix_chkpwd get user info from =
shadow file
>>> -    # on lsb images
>>> -    chmod 4755 ${sbindir}/unix_chkpwd
>>> +    # The lsb requires unix_chkpwd has setuid permission
>>> +    chmod 4755 ${D}${sbindir}/unix_chkpwd
>>=20
>> MIssing PR bump
>>=20
>=20
> Thanks for your reply, but I'm sorry I don't what did you mean, I =
guess you mean
> the Pull Request, it is in the cover letter:

No, I meant: you change the output package, so you need to increase PR=


