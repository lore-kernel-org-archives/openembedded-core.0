Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1StL3n-00079R-N8
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 18:00:39 +0200
Received: by lbol5 with SMTP id l5so7694707lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=JOucxDehy+jZcqfncTUJS0gfUuBROF/QdN/BTBh/bkI=;
	b=QX2odnaKR7nbh57+wJZoQLop2VSYMn/lQ7hhBQQOc2wCN5UR2O3uX2aahn7CEXAkJ+
	Jxvn4Zvah5wEcr+i5Fv+/B+BCMUTKP+vKV4pmMusUV/i8ij/DFX93SJmEx6PkuYcYFEe
	wwg2B7PenN8ksk3wEFFt6VfLyWa62N6RruVjX853mKd+8vIwFOJ+K/tbVY5rkDFOuSpe
	k3BwM62rMTAh5goYGq4qyID7E1q6AOSYFZxe35qOwMkus3c7c12+qpYDAAvRuJdWHToI
	4yL6okXEO5NFfbVkuTTzQ4SKIGoHdjJVthl1ROBZQZr0W7KeoI/Gmq+0uHS2HX2WW/nB
	aXcQ==
Received: by 10.112.100.234 with SMTP id fb10mr8013126lbb.12.1343058552571;
	Mon, 23 Jul 2012 08:49:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Mon, 23 Jul 2012 08:48:52 -0700 (PDT)
In-Reply-To: <1343058327.21788.98.camel@ted>
References: <1343053509-5931-1-git-send-email-Martin.Jansa@gmail.com>
	<1343058327.21788.98.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 23 Jul 2012 08:48:52 -0700
X-Google-Sender-Auth: gEtFOiuWrVJC4DGmwzN8djV6d1Q
Message-ID: <CABcZAN=CieCpsFCQ7Gsv=kF6MMy_W6T=itU6FtewXf-kPCz61w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] bitbake.conf: exclude whole MACHINEOVERRIDES from OVERRIDES vardeps
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
X-List-Received-Date: Mon, 23 Jul 2012 16:00:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 8:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-07-23 at 16:25 +0200, Martin Jansa wrote:
>> * whole MACHINEOVERRIDES can change e.g. between MACHINES with different=
 arm architecture, causing allarch packages to reexecute do_package
>>   bitbake-diffsigs ../shr-core/tmp-eglibc/stamps/all-oe-linux/xserver-no=
dm-init-2.0-r16.do_package.sigdata.90e760a8f6cecbd87cb2e95f1237e3cc ../shr-=
core/tmp-eglibc/stamps/all-oe-linux/xserver-nodm-init-2.0-r16.do_package.si=
gdata.9eeccfd15f25032b3b6b132534660fff
>>   basehash changed from 7618e17d3fda05d1f15246e6800ca0f0 to 97bc4dc8c152=
1c535bd96b2aa62d8a03
>>   Variable MACHINEOVERRIDES value changed from ${MACHINE}${@bb.utils.con=
tains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE=
_FEATURES", "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS} to ${MACHINE}${@bb.=
utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}${@bb.utils.con=
tains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}${@bb.utils.contains("TUNE=
_FEATURES", "armv5", ":armv5", "" ,d)}${@bb.utils.contains("TUNE_FEATURES",=
 "armv4", ":armv4", "" ,d)}:${MACHINE_CLASS}
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/conf/bitbake.conf |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> Won't this hide genuine changes where things should get rebuilt too?

If something uses a machine override, won't the overridden value for
that variable be the one which is stored in the checksum? So any
effects of this will result in checksum modification anyway, no?
--=20
Christopher Larson


