Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDkeW-0000Ft-N7
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 00:50:40 +0200
Received: by qcso7 with SMTP id o7so651748qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=jn3fq3o6ETe6x0kRbl4/X4N9AS9na4I7bqqian7NZGs=;
	b=jX5FfLRGDN/Sy7qJBxSvlbeORRMyarZRs+ufagfyUnTag/ePB87Dx483lBvYUXf73d
	ymYtciL6dMUqe5m3CPkIp0FU8hwetNKMofflKXnV7IdXv3veSXvs8clYofobyyjWcPpB
	42hjM6xX11apUOcaCYu1Oas59r5Yint+Dxe7sH9kui4ljG2DLUMDgsMlKNhEpzVpvqhl
	OAXwCC01AKVlNvkGCDYZ0Ng9tHbqDXzE7y7I4zGo3pnQOBRpbBRBkJ8QSh9cyC2dFI+i
	qJmJEKQNhHBnXis2AJ//dFcWJMTmtXCrkvCFfiPBMWyuacC5X1//VPJRD5j4kOPpt0Wg
	bmVQ==
Received: by 10.224.182.201 with SMTP id cd9mr666198qab.92.1333147295429; Fri,
	30 Mar 2012 15:41:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 15:41:15 -0700 (PDT)
In-Reply-To: <20120330082011.1c196c65@eb-e6520>
References: <1333023749-31830-1-git-send-email-eric@eukrea.com>
	<CABcZANkEiOkTzf4qvKkp_WOe-zE1oxwVoX46c0JJyLoH1kiO=A@mail.gmail.com>
	<20120330082011.1c196c65@eb-e6520>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 15:41:15 -0700
X-Google-Sender-Auth: M_Xnu7w49RjiXHzlEcewmXkx3y0
Message-ID: <CABcZAN=so0EeWP4VHgLiog-JeGiY16cbkj3hENwSVAjjjWgi-A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license.bbclass: remove existing license.manifest before appending new data
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
X-List-Received-Date: Fri, 30 Mar 2012 22:50:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 11:20 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Le Thu, 29 Mar 2012 16:22:06 -0700,
> Chris Larson <clarson@kergoth.com> a =C3=A9crit :
>
>> On Thu, Mar 29, 2012 at 5:22 AM, Eric B=C3=A9nard <eric@eukrea.com> wrot=
e:
>> > without this fix, we append license each time we build again the same =
image,
>> > ending with a large not up to date file.
>> >
>> > Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
>> > ---
>> > =C2=A0meta/classes/license.bbclass | =C2=A0 =C2=A04 ++++
>> > =C2=A01 files changed, 4 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbcla=
ss
>> > index 394a6d4..c85233c 100644
>> > --- a/meta/classes/license.bbclass
>> > +++ b/meta/classes/license.bbclass
>> > @@ -79,6 +79,10 @@ license_create_manifest() {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0# Get list of installed packages
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0list_installed_packages | grep -v "locale" =
|sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALLED_PKGS=3D`cat ${LICENSE_DIRECTORY}/=
${IMAGE_NAME}/package.manifest`
>> > + =C2=A0 =C2=A0 =C2=A0 # remove existing license.manifest file
>> > + =C2=A0 =C2=A0 =C2=A0 if [ -f ${LICENSE_DIRECTORY}/${IMAGE_NAME}/lice=
nse.manifest ]; then
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${LICENSE_DIRECT=
ORY}/${IMAGE_NAME}/license.manifest
>> > + =C2=A0 =C2=A0 =C2=A0 fi
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0# list of installed packages is broken for =
deb
>>
>> Probably not a concern in this particular case, but in general you
>> should avoid this sort of construct, as it's racy.
>
> ok, what would be the right way to do that to avoid the race problem ?

Generally speaking rather than doing "if this, then do that"
particularly with the filesystem, just do it and handle any errors. In
this case, rm -f, which exits silently if the file was already
removed.
--=20
Christopher Larson


