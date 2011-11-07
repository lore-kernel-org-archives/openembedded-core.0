Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNQA7-0000f7-9M
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:26:59 +0100
Received: by bkbzs2 with SMTP id zs2so405247bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CbVx0ZDPMuSQsro/sZ0NMXfMf+gYY8j0RcSLQhI5lWU=;
	b=kwoZwjm8igUZptN5BEiHEKhDDVBlupFybhm79DVLrjH7Kiyi5GwW6Fm/qfJdl0CGmo
	2f9N1gJIT6CcT2o1Bb5il0denoJsilFUCuk+GyYgAoxO5WCETSHnGzNb061T7fr1eWJY
	YDu4GvPP20A0az7SHav1Ik6CtbiHoe3ks76zA=
MIME-Version: 1.0
Received: by 10.204.140.215 with SMTP id j23mr9732258bku.52.1320675646224;
	Mon, 07 Nov 2011 06:20:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Mon, 7 Nov 2011 06:20:46 -0800 (PST)
In-Reply-To: <1320673961.22985.653.camel@phil-desktop>
References: <CAP9ODKp-5oZ3Fr=5EWbm7F1vR3ZFGXw9ezkPj-Ciui12SczM6A@mail.gmail.com>
	<1320673961.22985.653.camel@phil-desktop>
Date: Mon, 7 Nov 2011 12:20:46 -0200
X-Google-Sender-Auth: ItxqiI6LqaPa8S1aYzNeZvieyyk
Message-ID: <CAP9ODKo7EuOpHQ5s7tzWO=E-AkrB7SUQCf4fpHVAFNKr7qEqnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken BAD_RECOMMENDATIONS support
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
X-List-Received-Date: Mon, 07 Nov 2011 14:26:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2011 at 11:52, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-11-07 at 11:45 -0200, Otavio Salvador wrote:
>> Hello,
>>
>> It seems BAD_RECOMMENDATIONS support, in ipk, is broken.
>>
>> I checked and the rootfs_ipk is writting the contents into the opkg's
>> status file however it seems opkg when starts to install the packages
>> it overwrites or ignores it. People at IRC confirmated that this also
>> happens to them and thus this is indeed broken.
>>
>> Do someone know how I can debug opkg to see what's going on?
>
> You can add -V4 to ${ipkg_args} in package_install_internal_ipk() to get
> more verbosity, though the output is not always especially illuminating.
> It might be easiest to just hack the scripting so that it bails out at
> that point and then run opkg-cl by hand under the debugger.

Tracing the rootfs generation it proves to be opkg-cl rewritting status fil=
e.

Before the first 'opkg-cl install' the status file contains the
information about the bad recommendations but after it installs the
package_linguas, in package_install_internal_ipk then status has no
bad recommendated packages on it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


