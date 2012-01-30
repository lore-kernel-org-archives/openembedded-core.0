Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rrwc3-0005vd-9Q
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 20:09:59 +0100
Received: by lbol12 with SMTP id l12so336533lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7UTV+QaTJPmJO3+UJ4aQ1IhDHTt5EU332nu118tDQxE=;
	b=kfo/SsoYd5l8LkXM4u3aMywf8+lU+EIsO8e+8HlVTEHmF7ihtVMg4Y0z3Pa04twMKK
	2LYVliWFvLLGxsbI/9fJuilPlSBkjTo9qgpEvXBblc5SKIs1U41gaj2IWMLSD0mpKm4Y
	3aVZ5D7kiNKtl2sj5K8F3HFsj95coDxqqXejE=
MIME-Version: 1.0
Received: by 10.112.84.170 with SMTP id a10mr4881321lbz.22.1327949747505; Mon,
	30 Jan 2012 10:55:47 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Mon, 30 Jan 2012 10:55:47 -0800 (PST)
In-Reply-To: <4F26CD01.4050700@linux.intel.com>
References: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
	<1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
	<4F26CD01.4050700@linux.intel.com>
Date: Mon, 30 Jan 2012 19:55:47 +0100
Message-ID: <CALbNGRThtc0NUGPevQn0buhFVXyNBrCsfmkNqoX_NsU+pFS3ug@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
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
X-List-Received-Date: Mon, 30 Jan 2012 19:09:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 6:01 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/28/2012 04:00 PM, Andreas M=FCller wrote:
>>
>> Native support currently is appended in meta-oe. Native build failed wit=
h:
>>
>> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
>> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
>> | error parsing file Atk-1.0.gir: Failed to parse included gir GLib-2.0
>> | make[3]: *** [Atk-1.0.typelib] Error 1
>>
>> build tested in meta-oe / angstrom environment
>>
>> Signed-off-by: Andreas M=FCller<schnitzeltony@googlemail.com>
>> ---
>> =A0meta/recipes-support/atk/atk.inc =A0 =A0 =A0| =A0 13 -------------
>> =A0meta/recipes-support/atk/atk_2.2.0.bb | =A0 17 +++++++++++++----
>> =A02 files changed, 13 insertions(+), 17 deletions(-)
>> =A0delete mode 100644 meta/recipes-support/atk/atk.inc
>>
>> diff --git a/meta/recipes-support/atk/atk.inc
>> b/meta/recipes-support/atk/atk.inc
>> deleted file mode 100644
>> index 6a4fef6..0000000
>> --- a/meta/recipes-support/atk/atk.inc
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -DESCRIPTION =3D "An accessibility toolkit for GNOME."
>> -HOMEPAGE =3D "http://live.gnome.org/GAP/"
>> -BUGTRACKER =3D "https://bugzilla.gnome.org/"
>> -
>> -LICENSE =3D "LGPLv2& =A0LGPLv2+"
>>
>> -
>> -SECTION =3D "x11/libs"
>> -
>> -DEPENDS =3D "glib-2.0 gtk-doc-native"
>> -
>> -inherit autotools pkgconfig
>> -
>> -EXTRA_OECONF =3D "--disable-glibtest"
>> diff --git a/meta/recipes-support/atk/atk_2.2.0.bb
>> b/meta/recipes-support/atk/atk_2.2.0.bb
>> index 0d657b5..74e7288 100644
>> --- a/meta/recipes-support/atk/atk_2.2.0.bb
>> +++ b/meta/recipes-support/atk/atk_2.2.0.bb
>> @@ -1,14 +1,23 @@
>> -require atk.inc
>> +DESCRIPTION =3D "An accessibility toolkit for GNOME."
>> +HOMEPAGE =3D "http://live.gnome.org/GAP/"
>> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
>> +SECTION =3D "x11/libs"
>>
>> -PR =3D "r1"
>> +LICENSE =3D "GPLv2+& =A0LGPLv2+"
>
> Not sure what you changed here, but you did not fix this as Khem suggeste=
d.

After Khem's comment I checked the files mentioned in LIC_FILES_CHKSUM
and changed
from

LICENSE =3D "LGPLv2&  LGPLv2+"

to

LICENSE =3D "GPLv2+&  LGPLv2+"

and mentioned this for information in cover-letter for everybody to
cross-check. Since my initial patch did not touch license and I don't
exactly know how to handle this case what shall I do for V3:

1. Keep LICENSE and move the cover letter explanations to commit message - =
or
2. Set LGPLv2.1+ as Khem mentioned

> =A0Also, if you are making LICENSE changes the note you included in your =
00
> Patch email should really be in the Commit message instead.
>
> Thanks
> =A0 =A0 =A0 =A0Sau!

Andreas


