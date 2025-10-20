Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C672FCCD19F
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 17:16:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.2963.1760980570423179710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 10:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=M/rA/dt+;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3ee18913c0so887941566b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1760980569; x=1761585369; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DwScGvcwCxOALtqcJdX5D3p8LjJlFCx1xBnGoMpR6XU=;
        b=M/rA/dt++tQVMWp0w8B3bznrUtTrFWi4icsAj2l9NFBC+ezEEm3CHIXuURj/RfiQ5k
         lI6XmGI5zdkTDayn4NFulbZIuUTuAdVBT07TqSIrv45oh8HUhvKVlU8RNYQenvvUTs7l
         u7tT/c8+FfRsosfPygEa9pimjsHToNnQkMDa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760980569; x=1761585369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwScGvcwCxOALtqcJdX5D3p8LjJlFCx1xBnGoMpR6XU=;
        b=O9zEm219rFQO/XT9s0PsO0Jozg2uKkDd3B08DcTEJOzzfLs64ZoQ+pXsHdDJBMx8RZ
         FpBVU5Qcp9LO0dPLC0gPUphlURUp+73KvOXehtJ7BfxGLVCVRtqas0YFvOMTZGo0ba7l
         /vm6Y/rqgmew/N/FbD097/zuHVKZxCqhSDqSOcpYQiWO0ec4RR/4Ohys1FGrFw1Ih7dP
         G6Wr/SaHI63dODd91WtMRPSV6oYEjRlAl5JStE+1KJw0cIDY+GYMuDz51n3L1uj7Xcbx
         9rDlVAEpZ45b9UD/iucmWGUSlzxZDpfFXSOMdsXkS8fypZaooXml7Ja+UmWMKMYqBcbX
         qe6Q==
X-Gm-Message-State: AOJu0YxaOR/85N7UNZD4udCWOKlUofw4GwvZXP26bzmVFJ22/3eg89jx
	Xjc0uuXgAAgV/LqCXXZFNzfjHVnoYn5gq2REEyF5JF6dWZyUtcr3winzOhuRoHIuNg8Guih7j2T
	2m1XVe2wgABXXqjsWPCZr5wh/ZH9dE+oIYllrKGNjDw==
X-Gm-Gg: ASbGncsaCOoqVTV8g/Esl1LvLTRSCs7dqZLogIIE3WQeo06pve5R26WGDx8EOdkggXa
	VvKu0hKII9adNNK7oU3Yu13ebplH3X7uLLO0D78U2azHZPzXDlbXLAfxj3wZOVs59PtP6pTZqsy
	sTkDavOjkmXSHjbGuf9XfE+4wY8DlhmKpuKsE24FOewRzuFmG9WOm4qP04NkAMEHYn2pMVZ8ppE
	1GhQb109WJM1Y7LVMAstZl4s4Ugebm4Y76RDhORlbHykCY32Ztt9tRAX/9jWpYpcJpAZZK4Zv/3
	GMQ0tpMatbGsBFSNYw==
X-Google-Smtp-Source: AGHT+IFrwi0JNhHGWPAR6qHN1PkLa2IREIjsfvXGNBKAK3XWIIrKRDjbT6shPmOmoTt+MUj5Ia3qksgadF8BNlF8WW8=
X-Received: by 2002:a17:907:94c8:b0:b41:660:13b8 with SMTP id
 a640c23a62f3a-b647443cf35mr1587257366b.31.1760980568488; Mon, 20 Oct 2025
 10:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251016111628.3050999-1-ecordonnier@snap.com> <CANPvuRkBq+qZD+U588QWFHG60Pg24OvULjaaJJvfSCDx=RZYfw@mail.gmail.com>
In-Reply-To: <CANPvuRkBq+qZD+U588QWFHG60Pg24OvULjaaJJvfSCDx=RZYfw@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 20 Oct 2025 19:15:56 +0200
X-Gm-Features: AS18NWCcP-cneSsxvk8FELi4RsfzcIIZ0wuXC1uOg6fWYa8djlgvZfV8jzQvh-8
Message-ID: <CAHUKmYb0-jNFXkW_8LNojnKNw+mNJZLD42jZNqDHODQTFkYfRQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] opkg: upgrade 0.7.0 -> 0.9.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003dee9006419a3d5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 17:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225130

--0000000000003dee9006419a3d5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Jose Quaresma <quaresma.jose@gmail.com> : I have split the patch in 2.
Regarding the removal of XZ, it doesn't really make a difference, as xz is
included in the image anyway, and opkg compilation time is the same.

@mathieu Dubois-Briand: I had mistakenly tested the branch using a build of
poky (which doesn't use ipk files). I've tested it on master 416731b875 +
poky-altcfg now, and fixed the issue which was a typo in config.h.in.



On Thu, Oct 16, 2025 at 6:02=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com>
wrote:

> Hi Etienne
>
> Can you split the patch in two commits for each version.
>
> Etienne Cordonnier via lists.openembedded.org
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7=
i-eRwUTnghNpJxAqAQMyXF3F4V21bh&s=3DDfOve6GcE4fkNBG-2ZFQrmKfq__XSi4vz52l-ayk=
KAw&e=3D>
> <ecordonnier=3Dsnap.com@lists.openembedded.org> escreveu (quinta,
> 16/10/2025 =C3=A0(s) 12:18):
>
>> From: Etienne Cordonnier <ecordonnier@snap.com>
>>
>> See release notes at
>> -
>> http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.release-notes
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctopr=
oject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&d=3DDwMFaQ&c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V2=
1bh&s=3DKNbnXUHj2fSREpHV0s2F6aYqYvjxWDuTswGzIvWWV2k&e=3D>
>> -
>> http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.release-notes
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctopr=
oject.org_releases_opkg_opkg-2D0.8.0.release-2Dnotes&d=3DDwMFaQ&c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V2=
1bh&s=3DO6V-VGqDq5zU3nAG7icfVZe36d6oVOHOodkO840sECs&e=3D>
>>
>> [0.9.0] - 2025-06-27
>>
>> Semiannual opkg release.
>> Bumping the minor version as a result of the project build tooling
>> changing from autotools to cmake.
>>
>> - Added a Dockerfile container definition (`:docker/`) for a valid
>> developer build environment for opkg.
>>   - It's recommended that project contributors use this container to
>> build and test their changes.
>> - The AutoTools-based build framework has [been replaced](
>> https://git.yoctoproject.org/opkg/commit/?id=3D3f6040e321634471ec442fb0e=
80f140f1437e90b
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject=
.org_opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&d=3DDwMFa=
Q&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9T=
sRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJx=
AqAQMyXF3F4V21bh&s=3DDcpmG3-Bx6ce6HheIfWkI-J9FHTUksxIfct1E8oOiNw&e=3D>)
>> with a more modern, CMake framework.
>>   - Refer to the `docs/CONTRIBUTING.md` documentation for updated build
>> instructions.
>>
>> [0.8.0] - 2025-01-10
>>
>> The minor version bump in this release is due to the changes to cURL
>> error output line format.
>>
>> - [Changed](
>> https://git.yoctoproject.org/opkg/commit/?id=3Dab03377868256427279b36c4b=
2a298edae4260b8
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject=
.org_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298edae4260b8&d=3DDwMFa=
Q&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9T=
sRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJx=
AqAQMyXF3F4V21bh&s=3DH70DYguzkjmnuvRkCHHMveEPaNPlcBv9RxaLksBFUTo&e=3D>)
>> the error output for the curl download backend, to now report the HTTP
>> error code for failed requests.
>>   - e.g. `error: log_curl_download_error: Failed to download headers of
>> https://foo.bar/all/Packages.gz
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar_all_Pack=
ages.gz&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkb=
NonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F5=
5J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&s=3DRAtB8yMZIGmu5FIMg0JykVg8nV76aiQ9bfu6I=
rQrC8A&e=3D>:
>> The requested URL returned error: 401`
>> - Enabling debug-verbosity, while using the cURL backend, [will now](
>> https://git.yoctoproject.org/opkg/commit/?id=3Dce6fede3db931bb0da70d1334=
cdc4101d0aec702
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject=
.org_opkg_commit_-3Fid-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&d=3DDwMFa=
Q&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9T=
sRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJx=
AqAQMyXF3F4V21bh&s=3DUg3p6iIXLdlkNAjIPwAYEeaOBSGz4W9rI6gca8Aa-Qw&e=3D>)
>> print cURL's verbose error log to stderr when there is a download failur=
e.
>>   - The verbose output may contain confidential information about your
>> cURL transactions. So this is your reminder that debug-verbosity should =
not
>> be enabled in production systems or sensitive security environments.
>> - The commandline configuration file option (`-f`) [can now](
>> https://git.yoctoproject.org/opkg/commit/?id=3D36d08b93d2859992b624a4ba2=
f412cfa5c766050
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject=
.org_opkg_commit_-3Fid-3D36d08b93d2859992b624a4ba2f412cfa5c766050&d=3DDwMFa=
Q&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9T=
sRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJx=
AqAQMyXF3F4V21bh&s=3DUOBoaRU5Y4tzdqAYhSrdZ5XG3GT7V_HTW8kVlQnqHX0&e=3D>)
>> be specified multiple times, and each configuration file will be loaded =
and
>> their settings merged.
>> - [Fixed](
>> https://git.yoctoproject.org/opkg/commit/?id=3Dc87188d7535684fddb8cf8099=
3c147b215602b63
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject=
.org_opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b215602b63&d=3DDwMFa=
Q&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9T=
sRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJx=
AqAQMyXF3F4V21bh&s=3DjyBf9SJwZSCnTtZVGZohRY_fHgAj-ZbDYtX8O3SnT1k&e=3D>)
>> a bug in control field parsing where custom fields whose keys are simila=
r
>> to other fields could be confused by the parser.
>>
>> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> ---
>>  meta/recipes-devtools/opkg/opkg/run-ptest     |  3 +--
>>  .../opkg/{opkg_0.7.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&e=
=3D>
>> =3D> opkg_0.9.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&e=
=3D>}
>>    | 21 +++++++++++--------
>>  2 files changed, 13 insertions(+), 11 deletions(-)
>>  rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&e=
=3D>
>> =3D> opkg_0.9.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&e=
=3D>}
>> (77%)
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
>> b/meta/recipes-devtools/opkg/opkg/run-ptest
>> index 5fb7077eec9..8cf09adba57 100644
>> --- a/meta/recipes-devtools/opkg/opkg/run-ptest
>> +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
>> @@ -1,5 +1,4 @@
>>  #!/bin/sh
>>
>>  OPKG_PATH=3D$(which opkg)
>> -
>> -make OPKG_PATH=3D$OPKG_PATH run-tests
>> +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var
>> OPKG_PATH=3D$OPKG_PATH
>> diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&e=
=3D>
>> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&e=
=3D>
>> similarity index 77%
>> rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&e=
=3D>
>> rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&e=
=3D>
>> index 95480b47164..9fa32268541 100644
>> --- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&e=
=3D>
>> +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwU=
TnghNpJxAqAQMyXF3F4V21bh&s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&e=
=3D>
>> @@ -18,31 +18,31 @@ SRC_URI =3D "
>> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctopr=
oject.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.=
gz&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-=
eRwUTnghNpJxAqAQMyXF3F4V21bh&s=3Dta5Qcisz9X4bnk0_9uPOiSJqA4eK3OCu7IW2PaElyR=
w&e=3D>
>>             file://run-ptest \
>>             "
>>
>> -SRC_URI[sha256sum] =3D
>> "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
>> +SRC_URI[sha256sum] =3D
>> "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
>>
>>  # This needs to be before ptest inherit, otherwise all ptest files end
>> packaged
>>  # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
>>  # PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
>>  PACKAGES =3D+ "libopkg"
>>
>> -inherit autotools pkgconfig ptest
>> +inherit cmake pkgconfig ptest
>>
>>  target_localstatedir :=3D "${localstatedir}"
>>  OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>>
>>  PACKAGECONFIG ??=3D "libsolv"
>>
>> -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
>> +PACKAGECONFIG[gpg] =3D "-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\
>>      gnupg gpgme libgpg-error,\
>>      ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
>>      "
>> -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>> -PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,curl
>> openssl"
>> -PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
>> -PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libsolv"
>> +PACKAGECONFIG[curl] =3D "-DWITH_CURL=3D0N,-DWITH_CURL=3DOFF,curl"
>> +PACKAGECONFIG[ssl-curl] =3D "-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF,c=
url
>> openssl"
>> +PACKAGECONFIG[sha256] =3D "-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF"
>> +PACKAGECONFIG[libsolv] =3D
>> "-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LIBSOLV=3DOFF,libsolv"
>>
>> -EXTRA_OECONF =3D "--enable-zstd"
>
> -EXTRA_OECONF:append:class-native =3D "
>> --localstatedir=3D/${@os.path.relpath('${localstatedir}',
>> '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath('${sysconfd=
ir}',
>> '${STAGING_DIR_NATIVE}')}"
>> +EXTRA_OECMAKE =3D "-DWITH_ZSTD=3DON"
>>
>
> I wonder if we shouldn't also disable the XZ which is enabled by default
> and we don't use it.
>
> Jose
>
>
>> +EXTRA_OECMAKE:append:class-native =3D "
>> -DVARDIR=3D/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE=
}')}
>> -DSYSCONFDIR=3D/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIV=
E}')}"
>>
>>  do_install:append () {
>>         install -d ${D}${sysconfdir}/opkg
>> @@ -56,6 +56,9 @@ do_install:append () {
>>  }
>>
>>  do_install_ptest () {
>> +       # the ptest class uses a Makefile for installation, but cmake
>> uses Ninja per default so we need to install ptests manually:
>> +       cp -r ${S}/tests ${D}${PTEST_PATH}
>> +
>>         sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
>>         sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D "0=
"
>> ];then echo "FAIL:"$^;else echo "PASS:"$^;fi'
>> ${D}${PTEST_PATH}/tests/Makefile
>>  }
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224962):
>> https://lists.openembedded.org/g/openembedded-core/message/224962
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedd=
ed.org_g_openembedded-2Dcore_message_224962&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&s=3DA=
96g_c8XIWmusAl7AYv3FfTlBFDiBfjZbK3EvrBmeqA&e=3D>
>> Mute This Topic: https://lists.openembedded.org/mt/115787032/5052612
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedd=
ed.org_mt_115787032_5052612&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQCCsFdUt=
-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&s=3D7yYXkjigmF_deWqMG=
tQck7PTivbq6UQX_SHIKBjDK00&e=3D>
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedd=
ed.org_g_openembedded-2Dcore_unsub&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DHFaQ=
CCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&s=3DNqoQnEJdeq=
GKN_jWENKSttGZ2q78jAuMI51cyCnSsYs&e=3D>
>> [quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>

--0000000000003dee9006419a3d5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:quaresma.jose@gmail.com" tabindex=3D"-1">@Jose Quaresma</a>=C2=
=A0: I have split the patch in 2. Regarding the removal of XZ, it doesn&#39=
;t really make a difference, as xz is included in the image anyway, and opk=
g compilation time is the same.<br><br>@mathieu Dubois-Briand: I had mistak=
enly tested the branch using a build of poky (which doesn&#39;t use ipk fil=
es). I&#39;ve tested it on master=C2=A0416731b875=C2=A0<a class=3D"gmail_pl=
usreply" id=3D"plusReplyChip-2">+</a> poky-altcfg now, and fixed the issue =
which was a typo in <a href=3D"http://config.h.in">config.h.in</a>.<br><br>=
<br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Oct 16, 2025 at 6:02=E2=80=AFPM Jose Quar=
esma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb=
(0,0,0)">Hi Etienne</span></div><div><br></div>Can you split the patch in t=
wo commits for each version.<div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Etienne Cordonnier via <a href=3D"https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwMF=
aQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIG=
RfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i=
-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DDfOve6GcE4fkNBG-2ZFQrmKfq__XSi4vz52l-=
aykKAw&amp;e=3D" target=3D"_blank">lists.openembedded.org</a> &lt;ecordonni=
er=3D<a href=3D"mailto:snap.com@lists.openembedded.org" target=3D"_blank">s=
nap.com@lists.openembedded.org</a>&gt; escreveu (quinta, 16/10/2025 =C3=A0(=
s) 12:18):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_=
blank">ecordonnier@snap.com</a>&gt;<br>
<br>
See release notes at<br>
- <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download=
s.yoctoproject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&amp;d=3DDwMFa=
Q&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-=
eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DKNbnXUHj2fSREpHV0s2F6aYqYvjxWDuTswGzIv=
WWV2k&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http://downloads.yocto=
project.org/releases/opkg/opkg-0.9.0.release-notes</a><br>
- <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download=
s.yoctoproject.org_releases_opkg_opkg-2D0.8.0.release-2Dnotes&amp;d=3DDwMFa=
Q&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-=
eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DO6V-VGqDq5zU3nAG7icfVZe36d6oVOHOodkO84=
0sECs&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http://downloads.yocto=
project.org/releases/opkg/opkg-0.8.0.release-notes</a><br>
<br>
[0.9.0] - 2025-06-27<br>
<br>
Semiannual opkg release.<br>
Bumping the minor version as a result of the project build tooling changing=
 from autotools to cmake.<br>
<br>
- Added a Dockerfile container definition (`:docker/`) for a valid develope=
r build environment for opkg.<br>
=C2=A0 - It&#39;s recommended that project contributors use this container =
to build and test their changes.<br>
- The AutoTools-based build framework has [been replaced](<a href=3D"https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_=
commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwMFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTn=
ghNpJxAqAQMyXF3F4V21bh&amp;s=3DDcpmG3-Bx6ce6HheIfWkI-J9FHTUksxIfct1E8oOiNw&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org=
/opkg/commit/?id=3D3f6040e321634471ec442fb0e80f140f1437e90b</a>) with a mor=
e modern, CMake framework.<br>
=C2=A0 - Refer to the `docs/CONTRIBUTING.md` documentation for updated buil=
d instructions.<br>
<br>
[0.8.0] - 2025-01-10<br>
<br>
The minor version bump in this release is due to the changes to cURL error =
output line format.<br>
<br>
- [Changed](<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298e=
dae4260b8&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-s=
Qumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DH70DYguzkjmnuvR=
kCHHMveEPaNPlcBv9RxaLksBFUTo&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://git.yoctoproject.org/opkg/commit/?id=3Dab03377868256427279b36c4b2a=
298edae4260b8</a>) the error output for the curl download backend, to now r=
eport the HTTP error code for failed requests.<br>
=C2=A0 - e.g. `error: log_curl_download_error: Failed to download headers o=
f <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar=
_all_Packages.gz&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCC=
sFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DRAtB8yMZ=
IGmu5FIMg0JykVg8nV76aiQ9bfu6IrQrC8A&amp;e=3D" rel=3D"noreferrer" target=3D"=
_blank">https://foo.bar/all/Packages.gz</a>: The requested URL returned err=
or: 401`<br>
- Enabling debug-verbosity, while using the cURL backend, [will now](<a hre=
f=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoprojec=
t.org_opkg_commit_-3Fid-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&amp;d=3D=
DwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F5=
5J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DUg3p6iIXLdlkNAjIPwAYEeaOBSGz4W9rI=
6gca8Aa-Qw&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://git.yocto=
project.org/opkg/commit/?id=3Dce6fede3db931bb0da70d1334cdc4101d0aec702</a>)=
 print cURL&#39;s verbose error log to stderr when there is a download fail=
ure.<br>
=C2=A0 - The verbose output may contain confidential information about your=
 cURL transactions. So this is your reminder that debug-verbosity should no=
t be enabled in production systems or sensitive security environments.<br>
- The commandline configuration file option (`-f`) [can now](<a href=3D"htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_op=
kg_commit_-3Fid-3D36d08b93d2859992b624a4ba2f412cfa5c766050&amp;d=3DDwMFaQ&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx=
_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRw=
UTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DUOBoaRU5Y4tzdqAYhSrdZ5XG3GT7V_HTW8kVlQnqH=
X0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.=
org/opkg/commit/?id=3D36d08b93d2859992b624a4ba2f412cfa5c766050</a>) be spec=
ified multiple times, and each configuration file will be loaded and their =
settings merged.<br>
- [Fixed](<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_git.yoctoproject.org_opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b21=
5602b63&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQu=
myb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DjyBf9SJwZSCnTtZVG=
ZohRY_fHgAj-ZbDYtX8O3SnT1k&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.yoctoproject.org/opkg/commit/?id=3Dc87188d7535684fddb8cf80993c14=
7b215602b63</a>) a bug in control field parsing where custom fields whose k=
eys are similar to other fields could be confused by the parser.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
3 +--<br>
=C2=A0.../opkg/{<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
p-3A__opkg-5F0.7.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgG=
kICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DH=
FaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DOMs=
g5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&amp;e=3D" rel=3D"noreferrer" targe=
t=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"https://urldefense.proofp=
oint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQM=
yXF3F4V21bh&amp;s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
 21 +++++++++++--------<br>
=C2=A02 files changed, 13 insertions(+), 11 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTm=
phkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DU=
LJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqA=
QMyXF3F4V21bh&amp;s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&amp;e=3D"=
 rel=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"=
https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=
=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b=
8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2=
Tk1qnMxj9oBfs&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb<=
/a>} (77%)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devto=
ols/opkg/opkg/run-ptest<br>
index 5fb7077eec9..8cf09adba57 100644<br>
--- a/meta/recipes-devtools/opkg/opkg/run-ptest<br>
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
@@ -1,5 +1,4 @@<br>
=C2=A0#!/bin/sh<br>
<br>
=C2=A0OPKG_PATH=3D$(which opkg)<br>
-<br>
-make OPKG_PATH=3D$OPKG_PATH run-tests<br>
+make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var OPKG_PATH=
=3D$OPKG_PATH<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proof=
point.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DUL=
JTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQ=
MyXF3F4V21bh&amp;s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&amp;e=3D" =
rel=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> b/meta/recipes-devto=
ols/opkg/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__o=
pkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2ep=
ckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsF=
dUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DRFGtFKAinY=
Luzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&amp;e=3D" rel=3D"noreferrer" target=3D"_b=
lank">opkg_0.9.0.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofp=
oint.com/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQM=
yXF3F4V21bh&amp;s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
rename to meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTK=
UkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyX=
F3F4V21bh&amp;s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
index 95480b47164..9fa32268541 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttp-3A__opkg-5F0.7.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4=
V21bh&amp;s=3DOMsg5j2SntLtnq639bM4Jdhqbu8G8whfBGssWJUthzs&amp;e=3D" rel=3D"=
noreferrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4=
V21bh&amp;s=3DRFGtFKAinYLuzar9ujH_U3dTosu9W2Tk1qnMxj9oBfs&amp;e=3D" rel=3D"=
noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
@@ -18,31 +18,31 @@ SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN=
-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwMFaQ&amp;c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1D=
ULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNpJxAq=
AQMyXF3F4V21bh&amp;s=3Dta5Qcisz9X4bnk0_9uPOiSJqA4eK3OCu7IW2PaElyRw&amp;e=3D=
" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproject.org/re=
leases/${BPN}/${BPN}-${PV}.tar.gz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee=
26704bf8fe757c54567&quot;<br>
+SRC_URI[sha256sum] =3D &quot;440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa=
81a6a85493f0c89d0f5&quot;<br>
<br>
=C2=A0# This needs to be before ptest inherit, otherwise all ptest files en=
d packaged<br>
=C2=A0# in libopkg package if OPKGLIBDIR =3D=3D libdir, because default<br>
=C2=A0# PTEST_PATH ?=3D &quot;${libdir}/${BPN}/ptest&quot;<br>
=C2=A0PACKAGES =3D+ &quot;libopkg&quot;<br>
<br>
-inherit autotools pkgconfig ptest<br>
+inherit cmake pkgconfig ptest<br>
<br>
=C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
=C2=A0OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
<br>
-PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-gpg,\<br>
+PACKAGECONFIG[gpg] =3D &quot;-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\<br>
=C2=A0 =C2=A0 =C2=A0gnupg gpgme libgpg-error,\<br>
=C2=A0 =C2=A0 =C2=A0${@ &quot;gnupg&quot; if (&quot;native&quot; in d.getVa=
r(&quot;PN&quot;)) else &quot;gnupg-gpg&quot;}\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable-curl,curl&quot;<br>
-PACKAGECONFIG[ssl-curl] =3D &quot;--enable-ssl-curl,--disable-ssl-curl,cur=
l openssl&quot;<br>
-PACKAGECONFIG[sha256] =3D &quot;--enable-sha256,--disable-sha256&quot;<br>
-PACKAGECONFIG[libsolv] =3D &quot;--with-libsolv,--without-libsolv,libsolv&=
quot;<br>
+PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3D0N,-DWITH_CURL=3DOFF,curl&quot=
;<br>
+PACKAGECONFIG[ssl-curl] =3D &quot;-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF=
,curl openssl&quot;<br>
+PACKAGECONFIG[sha256] =3D &quot;-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF&quo=
t;<br>
+PACKAGECONFIG[libsolv] =3D &quot;-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LI=
BSOLV=3DOFF,libsolv&quot;<br>
<br>
-EXTRA_OECONF =3D &quot;--enable-zstd&quot;=C2=A0</blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
-EXTRA_OECONF:append:class-native =3D &quot; --localstatedir=3D/${@os.path.=
relpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} --sys=
confdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_N=
ATIVE}&#39;)}&quot;<br>
+EXTRA_OECMAKE =3D &quot;-DWITH_ZSTD=3DON&quot;<br></blockquote><div><br></=
div><div><div>I wonder if we shouldn&#39;t also disable the XZ which is ena=
bled by default and we don&#39;t use it.</div></div><div><br></div><div>Jos=
e</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+EXTRA_OECMAKE:append:class-native =3D &quot; -DVARDIR=3D/${@os.path.relpat=
h(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} -DSYSCONFDI=
R=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_NATIVE}=
&#39;)}&quot;<br>
<br>
=C2=A0do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/opkg<br>
@@ -56,6 +56,9 @@ do_install:append () {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# the ptest class uses a Makefile for installat=
ion, but cmake uses Ninja per default so we need to install ptests manually=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests ${D}${PTEST_PATH}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/@echo $^/d&#39; ${D}${PTEST_PAT=
H}/tests/Makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/@PYTHONPATH=3D. $(PYTHON) $^/a\=
\t@if [ &quot;$$?&quot; !=3D &quot;0&quot; ];then echo &quot;FAIL:&quot;$^;=
else echo &quot;PASS:&quot;$^;fi&#39; ${D}${PTEST_PATH}/tests/Makefile<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224962): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_22=
4962&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb=
3LInOO7B8b8F55J7i-eRwUTnghNpJxAqAQMyXF3F4V21bh&amp;s=3DA96g_c8XIWmusAl7AYv3=
FfTlBFDiBfjZbK3EvrBmeqA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/message/224962</a><br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_115787032_5052612&amp;d=3DDwMFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTnghNp=
JxAqAQMyXF3F4V21bh&amp;s=3D7yYXkjigmF_deWqMGtQck7PTivbq6UQX_SHIKBjDK00&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115787032/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwMFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DHFaQCCsFdUt-sQumyb3LInOO7B8b8F55J7i-eRwUTng=
hNpJxAqAQMyXF3F4V21bh&amp;s=3DNqoQnEJdeqGKN_jWENKSttGZ2q78jAuMI51cyCnSsYs&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div></div>
</div>
</blockquote></div>

--0000000000003dee9006419a3d5c--

