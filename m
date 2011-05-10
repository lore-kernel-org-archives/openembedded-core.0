Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJj9k-0007OE-68
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 11:23:04 +0200
Received: by wye20 with SMTP id 20so5062106wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 02:20:18 -0700 (PDT)
Received: by 10.216.143.74 with SMTP id k52mr3789637wej.8.1305019218567;
	Tue, 10 May 2011 02:20:18 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	bd8sm4264692wbb.65.2011.05.10.02.20.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 02:20:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305017031.30391.247.camel@rex>
Date: Tue, 10 May 2011 11:20:14 +0200
Message-Id: <733146FF-622B-4EB5-9EDD-40C79CB4FE3C@dominion.thruhere.net>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<118af5382d7c13327de95c46e4976ed7863ba3d0.1305004776.git.sgw@linux.intel.com>
	<1305017031.30391.247.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 26/30] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Tue, 10 May 2011 09:23:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2011, om 10:43 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-05-09 at 22:26 -0700, Saul Wold wrote:
>> From: Otavio Salvador <otavio@ossystems.com.br>
>>=20
>> This writes a qt.conf inside WORKDIR to properly configure projects
>> based on CMake. This is required since qmake variables (returned
>> by -query command) are fixed into the binary and can only be
>> changed using a qt.conf file.
>>=20
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> meta/classes/qmake_base.bbclass |   15 +++++++++++++++
>> 1 files changed, 15 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/classes/qmake_base.bbclass =
b/meta/classes/qmake_base.bbclass
>> index 24a0f11..37c44c7 100644
>> --- a/meta/classes/qmake_base.bbclass
>> +++ b/meta/classes/qmake_base.bbclass
>> @@ -31,6 +31,21 @@ oe_qmake_mkspecs () {
>>     done
>> }
>>=20
>> +do_generate_qt_config_file() {
>> +	export QT_CONF_PATH=3D${WORKDIR}/qt.conf
>> +	bbwarn "${WORKDIR}/qt.conf"
>> +	cat > ${WORKDIR}/qt.conf <<EOF
>> +[Paths]
>> +Prefix =3D ${STAGING_DIR}
>> +Binaries =3D ${BUILD_SYS}${bindir_native}
>> +Headers =3D ${MACHINE}${prefix}/include/qt4
>> +Plugins =3D ${MACHINE}${prefix}/lib/qt4/plugins/
>> +Mkspecs =3D ${MACHINE}${prefix}/share/qt4/mkspecs/
>=20
> Can we simplify this to use STAGING_BINDIR_NATIVE, STAGING_INCDIR,
> STAGING_LIBDIR and STAGING_DATADIR?


And consider the case of building without MACHINE and distros having a =
different staging layout. I know angstrom has one to enable parallel =
builds of uclibc and eglibc.

regards,

Koen=


