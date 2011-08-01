Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QnwlR-000104-6F
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:58:54 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QnwhF-000725-SK from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 10:54:34 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 1 Aug 2011 19:54:27 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A50669CC94@eu2-mail.mgc.mentorg.com>
In-Reply-To: <CAAQYJAuSxGv048+q=N-D6-MbVT3FqBjP+UroJprPAaNCxkD6JQ@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] [PATCH] kernel,cml1.bbclass: Move menuconfig to cml1
Thread-Index: AcxOuepPDnXU97UyTsaOS7v6eC1TqwBufbZQ
References: <1311942290-27217-1-git-send-email-noor_ahsan@mentor.com><989A078976CDAD4CB2DC976EEF70E2A50669CBBB@eu2-mail.mgc.mentorg.com>
	<CAAQYJAuSxGv048+q=N-D6-MbVT3FqBjP+UroJprPAaNCxkD6JQ@mail.gmail.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 01 Aug 2011 17:58:54 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

I'll send its separate patch.

Regards,
Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of =
Andrea Adami
Sent: Saturday, July 30, 2011 6:08 PM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] kernel,cml1.bbclass: Move menuconfig to =
cml1

On Fri, Jul 29, 2011 at 10:03 PM, Ahsan, Noor <Noor_Ahsan@mentor.com> =
wrote:
> * The menuconfig target exists in places other than the kernel that =
use
> kernel style config.
>
> Signed-off-by: Noor, Ahsan <noor_ahsan@mentor.com>
> ---
> =A0meta/classes/cml1.bbclass =A0 | =A0 12 ++++++++++++
> =A0meta/classes/kernel.bbclass | =A0 15 ---------------
> =A02 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 79218b4..a747af5 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -6,3 +6,15 @@ cml1_do_configure() {
>
> =A0EXPORT_FUNCTIONS do_configure
> =A0addtask configure after do_unpack do_patch before do_compile
> +
> +do_menuconfig() {
> + =A0 =A0 =A0 export TERMWINDOWTITLE=3D"${PN} Configuration"
> + =A0 =A0 =A0 export SHELLCMDS=3D"make menuconfig"
> + =A0 =A0 =A0 ${TERMCMDRUN}
> + =A0 =A0 =A0 if [ $? -ne 0 ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oefatal "'${TERMCMD}' not found. Check =
TERMCMD
> variable."
> + =A0 =A0 =A0 fi
> +}
> +do_menuconfig[nostamp] =3D "1"
> +addtask menuconfig after do_configure
> +
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 9c492a3..25d2629 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -197,21 +197,6 @@ kernel_do_configure() {
>
> =A0do_configure[depends] +=3D "${INITRAMFS_TASK}"
>
> -do_menuconfig() {
> - =A0 =A0 =A0 =A0export DISPLAY=3D'${DISPLAY}'
> - =A0 =A0 =A0 =A0export =
DBUS_SESSION_BUS_ADDRESS=3D'${DBUS_SESSION_BUS_ADDRESS}'
> - =A0 =A0 =A0 =A0export XAUTHORITY=3D'${XAUTHORITY}'
> - =A0 =A0 =A0 export TERMWINDOWTITLE=3D"${PN} Kernel Configuration"
> - =A0 =A0 =A0 export SHELLCMDS=3D"make menuconfig"
> - =A0 =A0 =A0 ${TERMCMDRUN}
> - =A0 =A0 =A0 if [ $? -ne 0 ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo "Fatal: '${TERMCMD}' not found. =
Check TERMCMD
> variable."
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit 1
> - =A0 =A0 =A0 fi
> -}
> -do_menuconfig[nostamp] =3D "1"
> -addtask menuconfig after do_configure
> -
> =A0pkg_postinst_kernel () {
> =A0 =A0 =A0 =A0cd /${KERNEL_IMAGEDEST}; update-alternatives --install
> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
> =A0}
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

While you're doing that, please think about adding the following task:

+do_savedefconfig() {
+       oe_runmake savedefconfig
+}
+
+addtask savedefconfig after do_configure

It is very handy way to shrink kernel defconfigs and minimize the diffs.

Regards

Andrea

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


