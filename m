Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXtxF-0002RG-Hy
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 15:54:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r42DZtWL008673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 May 2013 06:35:55 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 2 May 2013 06:35:55 -0700
Message-ID: <51826BBB.2090307@windriver.com>
Date: Thu, 2 May 2013 08:35:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
In-Reply-To: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r42DZtWL008673
Subject: Re: useradd.bbclass question
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 13:54:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 5/2/13 2:49 AM, Andreas M=FCller wrote:
> Hi,
>
> on one of my build machines useradd.bbclass seem to use the UID/GID of
> build host. On other machines useradd works correct.
>
> I have the follwing in gdm:
>
> <snip>
> do_install_append() {
>      ...
>      chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
>      chmod 0750 ${D}${localstatedir}/lib/gdm
> }
>
> ...
>
> USERADD_PACKAGES =3D "${PN}"
> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
> ${localstatedir}/lib/gdm --user-group gdm"
> <snip/>
>
> In sysroot /etc/group I see
> gdm:x:990:
>
> In sysroot /etc/group I see
> gdm:!:993:990::/var/lib/gdm:
>
> The folder in packet/image has IDs 42:42 which is taken from build host.

This says that something ran an operation outside of the pseudo environme=
nt.  So=20
it fell back to looking up the uid from the host system.  (The alternativ=
e is=20
the item was installed -before- the /etc/passwd,/etc/group was written to=
 the=20
disk.  If that happens, pseudo can also fall back to the system environme=
nt.)

> Any ideas what causes this - or is there something wrong with chown at
> do_install?
>
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



