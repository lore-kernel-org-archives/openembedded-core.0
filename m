Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SF8VB-0000Xd-Uq
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 20:30:46 +0200
Received: by qcso7 with SMTP id o7so2426228qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=FVUzdRSw9PunSwZIsgmfVfRL8hZXopHnuWLmRRaHPZk=;
	b=ywxE5LTqxdB8BLtVdxpeXoEhT6SxnQvmpFfObqFBTjkIFXZn9ow2VLSSWuHRTTd4NQ
	YpCWUutzjc8UGBelQW6zeLTAxi91bJLiYlGAyoLeY9eaHp4wkIQ0jrsnC4SzAUsGk5PE
	JHZkbA4cNuJ0F7gqWfBv4Z8MloDXcobTaBysKq7ydoOQJ4PZ9lK8Il7+1TiBTl98bCNd
	12iDrtXlombxCzZafkyQyb4WytesWdk4mZoJF/ep7mD0n3uXwHXB9T3NmKU8/3Oo1Yas
	UETI9bbfl3En1mQIrxpisei5WY5XGmce8TT+JVz5M95WTeqLxj/XGbqgm5OaNbMeKCFi
	D+ow==
Received: by 10.224.210.66 with SMTP id gj2mr2730404qab.3.1333477296045; Tue,
	03 Apr 2012 11:21:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.24.196 with HTTP; Tue, 3 Apr 2012 11:21:15 -0700 (PDT)
In-Reply-To: <4F7B3EAE.2000301@windriver.com>
References: <4F7B38C7.6010909@mlbassoc.com> <4F7B3B8C.6000200@windriver.com>
	<4F7B3C75.5030200@mlbassoc.com> <4F7B3EAE.2000301@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 Apr 2012 11:21:15 -0700
X-Google-Sender-Auth: 2ELJ-WVaQDcNX7SHj9twkAt8pXg
Message-ID: <CABcZANmodJB6t5MT+tYGvugCaf8Cba=FRS_HEb4Q5q=VGQXOPg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Schizophrenic package management
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
X-List-Received-Date: Tue, 03 Apr 2012 18:30:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 3, 2012 at 11:17 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 4/3/12 1:07 PM, Gary Thomas wrote:
>>
>> On 2012-04-03 12:03, Mark Hatle wrote:
>>>
>>> On 4/3/12 12:52 PM, Gary Thomas wrote:
>>>>
>>>> Why are both opkg-native and rpm-native needed to build images?
>>>> When I asked this previously, I was told that rpm was used because
>>>> it has superior dependency tracking. Fair enough (I guess), but
>>>> then why is opkg required if I build an image using
>>>> PACKAGE_CLASSES =3D "package_rpm"
>>>>
>>>
>>> rpm-native is used for internal dependency scanning. The exact tool is
>>> "rpmdeps". These dependencies may or may not be rolled up into package =
level
>>> dependencies by the packaging
>>> tool (which may be opkg, deb or rpm). (see package.bbclass)
>>>
>>> opkg-native is used for handling alternatives and similar during
>>> packaging and image creation. So it's also needed.
>>
>>
>> Why? =C2=A0Surely one or the other should be useful for this. =C2=A0I'm =
sure
>> that RedHat doesn't need opkg to build their images...
>
>
> (repeating Paul for the sake of threads when someone searches)
>
> OE uses the update-alternatives method of handing multiple packages that
> provide the same functionality. =C2=A0Packaging systems themselves don't =
do this,
> the helpers do.
>
> opkg-native provides update-alternatives-cworth (according to Paul E) and
> that is needed by the other components in the system to determine which
> version of a particular piece of functionality is needed during image
> creation.
>
> There is an "alternative" update-alternatives package, but I don't believ=
e
> there is a native version. =C2=A0If anything that is all that should be
> required...
>
> (And RedHat based linux distributions don't have any concept of
> alternatives. They generally decide which binary package will provide the
> functionality and that is the defacto standard for a given release. =C2=
=A0OE on
> the other hand is closer to Debian based systems in that regard. =C2=A0We=
 can
> build multiple packages that may provide the same functionality, then it'=
s
> up to the package install time to determine which version of the
> functionality is used as the default.)

What's quite interesting to me is that chkconfig has an alternatives
command in its source tree which seems to behave just like
update-alternatives and is written in C, and includes a man page. See
http://www.fastcoder.net/downloads/chkconfig-1.3.30c.tar.gz -
./alternatives.c, ./alternatives.8. I'd suggest we look closer at this
rather than continuing to rely on update-alternatives-cworth.
--=20
Christopher Larson


