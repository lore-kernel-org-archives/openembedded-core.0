Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SuQV8-0004CX-PL
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 18:01:22 +0200
Received: by lbol5 with SMTP id l5so1385750lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=JNwyL8M6tILBOSckRt7tnHTt6NxSJyyPRObz28ehXbI=;
	b=p9d1lsvaC7gaYYZ8ZOPQ8mpYxYl8mkiGvaxn66sZbOLtLxHbrxjZPDLnBQCTLgiczl
	wq1dHkPVlfu/806O/xNmbVDHvz03urqaPez3gV4twj9uFyb9jtYdxv8WFYFXm/C2Ersx
	YeGE8snZKYo2jQZHFGlj1enGyfphR/J+vUiLCijpoEGo1fmv93lVVaLFprAZF+oF9514
	WdIRr9HTA7BXdwPSSKuiaLGxVRGHxCvZjogirmzHfWtDr44+k0VFlQFs1iSvi4Dw1mf4
	mIOzPDZ245MwxgnQXHayUQmvIRI/fQCH3+8qvwPYtC57kEvwbI6/m7myDroSrzYw6NAh
	6iCQ==
Received: by 10.112.11.38 with SMTP id n6mr13309557lbb.82.1343317791861; Thu,
	26 Jul 2012 08:49:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Thu, 26 Jul 2012 08:49:31 -0700 (PDT)
In-Reply-To: <CALbNGRSJJ-SB10g676LDTNf1L97WXrCZTNZ79oFoAVGmovSOYg@mail.gmail.com>
References: <1343315761-6314-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0La41DbcZMFm-T5dH-_u52ZA4rL7i2LsHs-NLfZX8Nz6nQ@mail.gmail.com>
	<CALbNGRSJJ-SB10g676LDTNf1L97WXrCZTNZ79oFoAVGmovSOYg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Jul 2012 08:49:31 -0700
X-Google-Sender-Auth: RF6v6GHEqWOAyjfA_AiPKk41DH4
Message-ID: <CABcZANmPnPJcSAL2fJYQ+OLixKEZjRWMr+UhdHWZuBC+p3iAKA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-doc.bbclass: unbreak dependency-chain for native recipes
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
X-List-Received-Date: Thu, 26 Jul 2012 16:01:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 8:35 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Jul 26, 2012 at 5:19 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
>> On 26 July 2012 16:16, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
>>> -DEPENDS_virtclass-native_append =3D " gtk-doc-stub-native"
>>> +DEPENDS_append_virtclass-native =3D " gtk-doc-stub-native"
>>
>> Was this a typo on my part, or is there a semantic difference between th=
ose?
>>
>> Ross
>>
> It is not an answer to your question but
>
> I grepped for DEPENDS_virtclass-native_append in oe-core and did find
> one occurrence in gtk-doc.bbclass. DEPENDS_append_virtclass-native I
> found in xcb-proto.inc so I gave it a try by
>
> bitbake -e atk-native | grep ^DEPENDS

DEPENDS =3D "alpha"
DEPENDS_virtclass-native_append =3D "foo"

End result for native: the latter is applied, resulting in a
'DEPENDS_virtclass-native' whose contents are just 'foo'. Then
DEPENDS_virtclass-native overwrites DEPENDS, resulting in the main
variable only containing the bits you appended, not the original
contents.

To sum up, _<override>_append appends to the override, which then
overwrites the original, whereas _append_<override> appends directly
to the main variable, conditionally on the override.

I'm not sure if that clears it up.. I've never been good at describing
this. For reference, I'm pretty sure we put something in the bitbake
manual about this circumstance specifically, since we chose to leave
it this way to retain maximum flexibility when writing the code, but
realized that it was a potential source of confusion.
--=20
Christopher Larson


