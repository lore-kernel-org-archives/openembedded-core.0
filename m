Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web12.11483.1586946065055391788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 03:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=im8/x3Cl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.179, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f179.google.com with SMTP id z12so2755138ilb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DJEzwhzU0cdiSWaapWE/NOa2qQ2vmJ02tY/Ee2ZxPec=;
        b=im8/x3Cltf7nCSSDzX+3L+xsKAYtxsJg6loT12kIwqLYEyPJ3j9O4BxkR2gXUQgttk
         F6ZNE5J6syjsojvIU1JfQfPPLkJVNCLX47tfRCx5KrPsMZMXhsIOGGneI33b4iu3PNJR
         01DYCY1N6ebLZkQ5S5EKZtsHs4DeHYbObK8nlQsSsqrmoAjG5OvKUNsnqsmfiC9Tpw5P
         JjwYTCWgr5XUExVWN45IlTgVy6SU3K+PyvCYpH2VtsQLmF62o8Rf9qUOsn8Wnc0Fy3+g
         jrGaXxLOxb1uMTjw5rVwzLtxdCgYUAaS6swZ3Udq4ZJViN7hyKY+hQGATar5MFMetCRn
         spaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DJEzwhzU0cdiSWaapWE/NOa2qQ2vmJ02tY/Ee2ZxPec=;
        b=Qw3AL8krMcfrE/f6N+iSTj7xHbcOSWR34tX8Ib6n7DCRzdQ0z+aXVPalHIOGpksgR2
         7MNbdsOl4Q1+wf4TVM5XU/ISSlQQSCipiEuwUXDCjNhFGb1rUGUS9jr689McAxRVKGsm
         HaHvuvY3fljbZmN3BE1CF8XjxDurgDZ5jwZYLiipVmbp1oDulT/DxJCFhH0aosNRjU9p
         yAdJ3iOurpeJBfKXGUCXPL72ZUn5NucCTUIDD/dssx9kaY1AbdfbUa30PdXqTQNhTGsj
         C35hEgrEyCpl7Ze8Ul7j+eAXx+gQgUEQTaWff5rIL2dSbZWYbQ8CbZo774EppQyngD7T
         3C0Q==
X-Gm-Message-State: AGi0PuY6AoahHC7MUPlzvUMj2FJvOjnfVrW0lO2sRTYP7t3yrExB359m
	RKlsUV07aovts7jsal5BabbnGvg6Pe8HD6VTN331hA==
X-Google-Smtp-Source: APiQypI5MFCN/768WSRmQlVuG3aqrd5AcR0Sj0ppmwIw3rHsbxtWZO8RECrsCM+kcbt9e3law0K2VAwn6V1JmO/wrlk=
X-Received: by 2002:a92:dac8:: with SMTP id o8mr4460959ilq.189.1586946064403;
 Wed, 15 Apr 2020 03:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200406170229.25363-1-brgl@bgdev.pl> <20200406170229.25363-3-brgl@bgdev.pl>
In-Reply-To: <20200406170229.25363-3-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Wed, 15 Apr 2020 12:20:53 +0200
Message-ID: <CAMRc=MdmrCSUYJXu7nhipPLLJFa6qdzD0E8Zq3S38mZKANpLUg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] image.bbclass: deploy image artifacts in stages
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 6 kwi 2020 o 19:02 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> override. This way each generated set of artifacts is deployed as soon
> as it's ready instead of the do_image_complete task handling the entire
> deployement. This allows us to better fine-tune dependencies e.g. we
> can make do_image_wic depend on fitImage task which can in turn depend
> on do_image_ext4.
>
> We need delete the IMGDEPLOYDIR variable from the data object passed
> to each image task so that it gets expanded with the correct override.
>
> In order to make sure that tasks added to SSTATETASKS in anonymous python
> functions are correctly setup, move the code that assigns pre- and
> postfuncs to an event handler invoked on bb.event.RecipeTaskPreProcess
> in sstate.bbclass. This event is fired right after the anonymous
> functions.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta/classes/image.bbclass  | 17 +++++++++++++++++
>  meta/classes/sstate.bbclass |  4 ++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 07aa1f1fa5..ffd63aa82a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -428,10 +428,12 @@ python () {
>          # date/time values. It will get expanded at execution time.
>          # Similarly TMPDIR since otherwise we see QA stamp comparision p=
roblems
>          # Expand PV else it can trigger get_srcrev which can fail due to=
 these variables being unset
> +        # Delete IMGDEPLOYDIR so that each task gets its own, overriden =
value
>          localdata.setVar('PV', d.getVar('PV'))
>          localdata.delVar('DATETIME')
>          localdata.delVar('DATE')
>          localdata.delVar('TMPDIR')
> +        localdata.delVar('IMGDEPLOYDIR')
>          vardepsexclude =3D (d.getVarFlag('IMAGE_CMD_' + realt, 'vardepse=
xclude', True) or '').split()
>          for dep in vardepsexclude:
>              localdata.delVar(dep)
> @@ -502,6 +504,21 @@ python () {
>
>          bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_im=
age_complete', after))
>          bb.build.addtask(task, 'do_image_complete', after, d)
> +
> +        imgdeploydir =3D d.getVar('IMGDEPLOYDIR')
> +        task_override =3D task[3:].replace('_', '-') # 'do_image_ext4' b=
ecomes 'image-ext4'
> +        taskdeploydir =3D '{}/deploy-{}-{}'.format(os.path.dirname(imgde=
ploydir),
> +                                                 d.getVar('PN'), task_ov=
erride)
> +
> +        # Each image task gets its own IMGDEPLOYDIR directory and is add=
ed to
> +        # SSTATETASKS. This way every set of artifacts gets deployed rig=
ht after
> +        # the do_image_foo task completes.
> +        d.setVar('IMGDEPLOYDIR_task-{}'.format(task_override), taskdeplo=
ydir)
> +        d.appendVar('SSTATETASKS', ' {}'.format(task))
> +        d.setVarFlag(task, 'sstate-inputdirs', taskdeploydir)
> +        d.setVarFlag(task, 'sstate-outputdirs', d.getVar('DEPLOY_DIR_IMA=
GE'))
> +        d.setVarFlag(task, 'cleandirs', taskdeploydir)
> +        d.setVar('SSTATE_SKIP_CREATION_task-{}'.format(task_override), '=
1')
>  }
>
>  #
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index c73c3b42a7..3c71312010 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -138,13 +138,17 @@ python () {
>          d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
>          d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWS=
PEC}")
>          d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
> +}
>
> +python sstate_setup_tasks() {
>      unique_tasks =3D sorted(set((d.getVar('SSTATETASKS') or "").split())=
)
>      d.setVar('SSTATETASKS', " ".join(unique_tasks))
>      for task in unique_tasks:
>          d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
>          d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
>  }
> +addhandler sstate_setup_tasks
> +sstate_setup_tasks[eventmask] =3D "bb.event.RecipeTaskPreProcess"
>
>  def sstate_init(task, d):
>      ss =3D {}
> --
> 2.25.0
>

Gentle ping.

Bart
