Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoJyF-0001fF-SD
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 20:45:39 +0200
Received: by wwi18 with SMTP id 18so42550wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 11:41:18 -0700 (PDT)
Received: by 10.216.167.8 with SMTP id h8mr2280519wel.87.1312310478105;
	Tue, 02 Aug 2011 11:41:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l68sm26779weq.10.2011.08.02.11.41.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 11:41:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E3843B1.2060008@linux.intel.com>
Date: Tue, 2 Aug 2011 20:41:10 +0200
Message-Id: <163C78A4-A69C-49D1-9498-A77F45918E00@dominion.thruhere.net>
References: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com>
	<4E3843B1.2060008@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] kernel,cml1.bbclass: Move menuconfig to cml1
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
X-List-Received-Date: Tue, 02 Aug 2011 18:45:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2011, om 20:36 heeft Saul Wold het volgende geschreven:

> On 07/29/2011 05:24 AM, Noor, Ahsan wrote:
>> * The menuconfig target exists in places other than the kernel that =
use kernel style config.
>>=20
>> Signed-off-by: Noor, Ahsan<noor_ahsan@mentor.com>
>> ---
>>  meta/classes/cml1.bbclass   |   12 ++++++++++++
>>  meta/classes/kernel.bbclass |   15 ---------------
>>  2 files changed, 12 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
>> index 79218b4..a747af5 100644
>> --- a/meta/classes/cml1.bbclass
>> +++ b/meta/classes/cml1.bbclass
>> @@ -6,3 +6,15 @@ cml1_do_configure() {
>>=20
>>  EXPORT_FUNCTIONS do_configure
>>  addtask configure after do_unpack do_patch before do_compile
>> +
>> +do_menuconfig() {
>> +	export TERMWINDOWTITLE=3D"${PN} Configuration"
>> +	export SHELLCMDS=3D"make menuconfig"
>> +	${TERMCMDRUN}
>> +	if [ $? -ne 0 ]; then
>> +		oefatal "'${TERMCMD}' not found. Check TERMCMD =
variable."
>> +	fi
>> +}
>> +do_menuconfig[nostamp] =3D "1"
>> +addtask menuconfig after do_configure
>> +
>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>> index 9c492a3..25d2629 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -197,21 +197,6 @@ kernel_do_configure() {
>>=20
>>  do_configure[depends] +=3D "${INITRAMFS_TASK}"
>>=20
>> -do_menuconfig() {
>> -        export DISPLAY=3D'${DISPLAY}'
>> -        export =
DBUS_SESSION_BUS_ADDRESS=3D'${DBUS_SESSION_BUS_ADDRESS}'
>> -        export XAUTHORITY=3D'${XAUTHORITY}'
>> -	export TERMWINDOWTITLE=3D"${PN} Kernel Configuration"
>> -	export SHELLCMDS=3D"make menuconfig"
>> -	${TERMCMDRUN}
>> -	if [ $? -ne 0 ]; then
>> -		echo "Fatal: '${TERMCMD}' not found. Check TERMCMD =
variable."
>> -		exit 1
>> -	fi
>> -}
>> -do_menuconfig[nostamp] =3D "1"
>> -addtask menuconfig after do_configure
>> -
>>  pkg_postinst_kernel () {
>>  	cd /${KERNEL_IMAGEDEST}; update-alternatives --install =
/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} =
${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
>>  }
>=20
> I think this patch will break the linux-* recipes if someone tries to =
use the menuconfig task.
>=20
> I think you need to also modify the linux-* recipes that currently =
inherit kernel to also include cmd1

or make kernel.bbclass inherit it?=


