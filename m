Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A923D600FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 18:18:31 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UxLRo-0001ud-2u from Noor_Ahsan@mentor.com ;
	Thu, 11 Jul 2013 11:18:32 -0700
Received: from SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 11 Jul 2013 11:18:32 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.02.0247.003; Thu, 11 Jul 2013 19:18:30 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] [v2] openssh: Enabling with systemd
Thread-Index: AQHOfmEFJGg+SM52LUa/6qG2i9S9VJlfyVV0
Date: Thu, 11 Jul 2013 18:18:30 +0000
Message-ID: <53609789-437E-429A-997E-7A1BECF21A48@mentor.com>
References: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>,
	<51DEF360.8030509@linux.intel.com>
In-Reply-To: <51DEF360.8030509@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Jul 2013 18:18:32.0525 (UTC)
	FILETIME=[0CFF67D0:01CE7E63]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [v2] openssh: Enabling with systemd
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
X-List-Received-Date: Thu, 11 Jul 2013 18:18:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We are seeing different checks for different recipes. Do you guys think tha=
t it is possible to handle them in bbclass.=20

Noor
On Jul 11, 2013, at 23:04, "Saul Wold" <sgw@linux.intel.com> wrote:

> On 07/11/2013 12:45 AM, Shakeel, Muhammad wrote:
>> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>>=20
>> - Remove dependency on systemd layer
>> - Install 'sysv' related files only if distro has this feature
>>=20
> Seeing all these changes has me thinking we really need to support this =
correctly in the systemd and maybe a new sysvinit bbclass since you are doi=
ng the same thing in multiple recipes, seems like the classes should have s=
ome kind of do_install_append that operates on those files.
>=20
> I guess this has been mentioned by JaMa on the oe-devel list, and Ross m=
ight be looking into it, but he could use some help if you have time to add=
ress the bbclass that would be very helpful.
>=20
> See also: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4309
>=20
> I am going to hold off taking any more of these systemd patches until we=
 get this sorted out.
>=20
>=20
> Thanks
>    Sau!
>=20
>=20
>> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>> ---
>>  .../openssh/openssh-6.2p2/sshd.socket              |   11 ++++++++
>>  .../openssh/openssh-6.2p2/sshd@.service            |    9 ++++++
>>  .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 +++++++
>>  meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   29 ++++++++++++=
+++++---
>>  4 files changed, 55 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socke=
t b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
>> new file mode 100644
>> index 0000000..753a33b
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
>> @@ -0,0 +1,11 @@
>> +[Unit]
>> +Conflicts=3Dsshd.service
>> +
>> +[Socket]
>> +ExecStartPre=3D/bin/mkdir -p /var/run/sshd
>> +ListenStream=3D22
>> +Accept=3Dyes
>> +
>> +[Install]
>> +WantedBy=3Dsockets.target
>> +Also=3Dsshdgenkeys.service
>> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.serv=
ice b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
>> new file mode 100644
>> index 0000000..d118490
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
>> @@ -0,0 +1,9 @@
>> +[Unit]
>> +Description=3DOpenSSH Per-Connection Daemon
>> +After=3Dsshdgenkeys.service
>> +
>> +[Service]
>> +ExecStart=3D-/usr/sbin/sshd -i
>> +ExecReload=3D/bin/kill -HUP $MAINPID
>> +StandardInput=3Dsocket
>> +StandardError=3Dsyslog
>> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkey=
s.service b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.ser=
vice
>> new file mode 100644
>> index 0000000..c717214
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.servi=
ce
>> @@ -0,0 +1,10 @@
>> +[Unit]
>> +Description=3DSSH Key Generation
>> +
>> +[Service]
>> +ExecStart=3D/usr/bin/ssh-keygen -A
>> +Type=3Doneshot
>> +RemainAfterExit=3Dyes
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/=
recipes-connectivity/openssh/openssh_6.2p2.bb
>> index ab2eefb..b9657d5 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
>> @@ -26,14 +26,17 @@ SRC_URI =3D "ftp://ftp.openbsd.org/pub/OpenBSD/Open=
SSH/portable/openssh-${PV}.tar.
>>             file://init \
>>             file://openssh-CVE-2011-4327.patch \
>>             file://mac.patch \
>> -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}'=
, '', d)}"
>> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}'=
, '', d)} \
>> +           file://sshd.socket \
>> +           file://sshd@.service \
>> +           file://sshdgenkeys.service "
>>=20
>>  PAM_SRC_URI =3D "file://sshd"
>>=20
>>  SRC_URI[md5sum] =3D "be46174dcbb77ebb4ea88ef140685de1"
>>  SRC_URI[sha256sum] =3D "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c76=
6432e32161b842313b"
>>=20
>> -inherit useradd update-rc.d update-alternatives
>> +inherit useradd update-rc.d update-alternatives systemd
>>=20
>>  USERADD_PACKAGES =3D "${PN}-sshd"
>>  USERADD_PARAM_${PN}-sshd =3D "--system --no-create-home --home-dir /va=
r/run/sshd --shell /bin/false --user-group sshd"
>> @@ -41,6 +44,10 @@ INITSCRIPT_PACKAGES =3D "${PN}-sshd"
>>  INITSCRIPT_NAME_${PN}-sshd =3D "sshd"
>>  INITSCRIPT_PARAMS_${PN}-sshd =3D "defaults 9"
>>=20
>> +SYSTEMD_PACKAGES =3D "${PN}-sshd"
>> +SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket"
>> +SYSTEMD_AUTO_ENABLE =3D "enable"
>> +
>>  PACKAGECONFIG ??=3D "tcp-wrappers"
>>  PACKAGECONFIG[tcp-wrappers] =3D "--with-tcp-wrappers,,tcp-wrappers"
>>=20
>> @@ -82,8 +89,21 @@ do_install_append () {
>>              install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/ss=
hd
>>          fi
>>      done
>> -    install -d ${D}${sysconfdir}/init.d
>> -    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
>> +
>> +    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)=
}; then
>> +        install -d ${D}${sysconfdir}/init.d
>> +        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
>> +    fi
>> +
>> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
>> +        install -d ${D}${systemd_unitdir}/system
>> +        install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/=
system
>> +        install -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir=
}/system
>> +        install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_u=
nitdir}/system
>> +        sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/sys=
tem/sshd@.service
>> +        sed -i 's,/usr/bin/,${bindir}/,g' ${D}${systemd_unitdir}/syste=
m/sshdgenkeys.service
>> +    fi
>> +
>>      rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
>>      rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}$=
{localstatedir}
>>  }
>> @@ -95,6 +115,7 @@ FILES_${PN}-scp =3D "${bindir}/scp.${BPN}"
>>  FILES_${PN}-ssh =3D "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config=
"
>>  FILES_${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
>>  FILES_${PN}-sshd +=3D "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd=
_config"
>> +FILES_${PN}-sshd +=3D "${systemd_unitdir}"
>>  FILES_${PN}-sftp =3D "${bindir}/sftp"
>>  FILES_${PN}-sftp-server =3D "${libexecdir}/sftp-server"
>>  FILES_${PN}-misc =3D "${bindir}/ssh* ${libexecdir}/ssh*"
>>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

