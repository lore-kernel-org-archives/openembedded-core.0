Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52221E8FDC3
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 09:24:36 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.11370.1696497870352434505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 02:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPAgLDet;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c27d653856so22866641fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696497868; x=1697102668; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJB3HNyGpmdwtLNa7VHQ5xmKxX/JPKb9k8TW1CGiriM=;
        b=UPAgLDetjUpOxZGcLuoRiCoAv1/hl8brawvXUcMUuzPgrqWfkqJN5CstrzA9NgKCKj
         z4rcFq+/7fCbQzfWb2m2Os2ENPDBkDPi9ppAPTMeqb/SepocZ3ydv/RHgDl/8sP1+nUK
         gTtkbWUpn9mCrq5MJkuv4svgREjVIcA0m4gcSHAMwCreXtLx2YWprV/PPZbwCcGOORfr
         keGxpFrcqrPcdlJuh9C/2S6HWtbVErkBQOfBShQHKXV5QCT6oWl082mvMM7CNtVXwkDA
         bLs+ZecKRQVWKYkwJmic0gAbtuYkymqfjIAZWzCwB/6xH2nAqlJYIzxMZWnFWlwmvlBr
         mkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696497868; x=1697102668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJB3HNyGpmdwtLNa7VHQ5xmKxX/JPKb9k8TW1CGiriM=;
        b=rx85VYDIADJ0xGMJLCOe7P3qaKh2vbqiWZFHgQx3+DPV8UdCp8Tu2hz6cZm7C4ungU
         mXuS/JI7LoTGnVl6X9wgQ+8aL5ghyOZIv/W3KMbkEjQg36ziNydpnO1Vd8eeIOoQl073
         WXMQwcQFQCe0nHVkj7W5hxuEzDPCpD4Y5++3Fb9Hsi4nWk3ycEyLRHqw6YX15Zm8b3j5
         5C/3+L+PBP7waT69okcO8lxwswdD1+yFHSY5aqlkMKD1EmR3I3WUfwxfOv5wNumewx8C
         A0tmYURGtfPXqD2EZzMYW7pcDn1HJgxCpeQmV//3xwKwPTnGTyimVDKs21oQXDGvV1Ig
         qzIA==
X-Gm-Message-State: AOJu0YxU3M81fQ6zbPFtE0L4EZJO5ZvDhsT+O1m2KBM9ATL6FHs0NW+0
	UlUzpRtGiYiiwTjIjYAFv6G4R12NDjpjbnflN1vHOLJkVxc=
X-Google-Smtp-Source: AGHT+IHK5ecJZbI6f/qM7DvemMEe/zKDm02mbjNBtKObnjKuCzPWDrJ4+ckFZDI/nzX314Pedo3u4ADnBLUUHjFCC7s=
X-Received: by 2002:a05:6512:e95:b0:502:e0dd:628b with SMTP id
 bi21-20020a0565120e9500b00502e0dd628bmr574696lfb.32.1696497867930; Thu, 05
 Oct 2023 02:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231004144106.1577-1-jermain.horsman@nedap.com>
In-Reply-To: <20231004144106.1577-1-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Oct 2023 11:24:16 +0200
Message-ID: <CANNYZj-tS36SKm6ss046Yf8NTcznJrtx3FAMkJ6w8sQs-pcKJw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] scripts/oe-setup-layers: Allow setup using
 branches instead of fixed revisions
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 09:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188713

This looks roughly correct, but it needs to be addressed from the
other end first. If json's schema and conformance tests should be
updated, then those should be offered for review first, and not code
that makes use of those changes.

Alex

On Wed, 4 Oct 2023 at 16:41, Jermain Horsman <jermain.horsman@nedap.com> wr=
ote:
>
> From: Jermain Horsman <jermain.horsman@nedap.com>
>
> These changes allow for situations where one or more layers are checked o=
ut
> using a branch instead of a revision, care is taken to make sure this wor=
ks
> when using multiple remotes.
> All changes made are backwards compatible with older setup-layer json fil=
es.
>
> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
> ---
>
>
> During development it can be useful to use a branch instead of a revision=
,
> e.g. when rebasing often or just for easy upgrading of the setup.
>
> This is a first step, as it is currently not possible to generate or edit
> the layers-setup json files using bitbake-layers create-layers-setup, it
> is however possible to edit these manually and use this and since it is
> backwards compatible current json files will still work.
>
> The idea is to update bitbake-layers create-layers-setup and extend it to
> include the options used here, something like:
> bitbake-layers create-layers-setup --update-git-rev some.json poky [--bra=
nch | <revision> ]
>
>
>
>  scripts/oe-setup-layers | 91 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 84 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> index c8012fa670..49f8cdef47 100755
> --- a/scripts/oe-setup-layers
> +++ b/scripts/oe-setup-layers
> @@ -37,6 +37,16 @@ def _is_repo_at_rev(repodir, rev):
>          pass
>      return False
>
> +def _is_repo_at_head(repodir):
> +    try:
> +        curr_branch =3D subprocess.check_output('git -C {repodir} for-ea=
ch-ref --format=3D\'%(refname:short)\' "$(git -C {repodir} symbolic-ref -q =
HEAD)"'.format(repodir=3Drepodir),
> +                                            shell=3DTrue, stderr=3Dsubpr=
ocess.DEVNULL)
> +        if not curr_branch.strip().decode("utf-8"):
> +            return True
> +    except subprocess.CalledProcessError:
> +        pass
> +    return False
> +
>  def _is_repo_at_remote_uri(repodir, remote, uri):
>      try:
>          curr_uri =3D subprocess.check_output("git -C %s remote get-url %=
s" % (repodir, remote), shell=3DTrue, stderr=3Dsubprocess.DEVNULL)
> @@ -46,6 +56,39 @@ def _is_repo_at_remote_uri(repodir, remote, uri):
>          pass
>      return False
>
> +def _is_repo_at_default_remote(repodir, default_remote):
> +    try:
> +        curr_default_remote =3D subprocess.check_output('git -C {repodir=
} config checkout.defaultRemote'.format(repodir=3Drepodir), shell=3DTrue, s=
tderr=3Dsubprocess.DEVNULL)
> +        if curr_default_remote.strip().decode("utf-8") =3D=3D default_re=
mote:
> +            return True
> +    except subprocess.CalledProcessError:
> +        pass
> +    return False
> +
> +def _is_repo_at_branch(repodir, branch):
> +    try:
> +        curr_branch =3D subprocess.check_output('git -C {repodir} for-ea=
ch-ref --format=3D\'%(refname:short)\' "$(git -C {repodir} symbolic-ref -q =
HEAD)"'.format(repodir=3Drepodir),
> +                                            shell=3DTrue, stderr=3Dsubpr=
ocess.DEVNULL)
> +        if curr_branch.strip().decode("utf-8") =3D=3D branch:
> +            return True
> +    except subprocess.CalledProcessError:
> +        pass
> +    return False
> +
> +def _is_repo_branch_latest(repodir):
> +    try:
> +        curr_rev =3D subprocess.check_output('git -C {repodir} rev-parse=
 HEAD'.format(repodir=3Drepodir),
> +                                            shell=3DTrue, stderr=3Dsubpr=
ocess.DEVNULL)
> +        upstream_branch =3D subprocess.check_output('git -C {repodir} fo=
r-each-ref --format=3D\'%(upstream:short)\' "$(git -C {repodir} symbolic-re=
f -q HEAD)"'.format(repodir=3Drepodir),
> +                                            shell=3DTrue, stderr=3Dsubpr=
ocess.DEVNULL)
> +        upstream_rev =3D subprocess.check_output('git -C {repodir} rev-p=
arse {upstream_branch}'.format(repodir=3Drepodir, upstream_branch=3Dupstrea=
m_branch.strip().decode("utf-8")),
> +                                            shell=3DTrue, stderr=3Dsubpr=
ocess.DEVNULL)
> +        if curr_rev.strip().decode("utf-8") =3D=3D upstream_rev.strip().=
decode("utf-8"):
> +            return True
> +    except subprocess.CalledProcessError:
> +        pass
> +    return False
> +
>  def _contains_submodules(repodir):
>      return os.path.exists(os.path.join(repodir,".gitmodules"))
>
> @@ -63,10 +106,17 @@ def _do_checkout(args, json):
>          r_remote =3D r_data['git-remote']
>          rev =3D r_remote['rev']
>          desc =3D r_remote['describe']
> -        if not desc:
> -            desc =3D rev[:10]
>          branch =3D r_remote['branch']
>          remotes =3D r_remote['remotes']
> +        default_remote =3D None
> +        if not rev:
> +            # note: default-remote is required if rev is not set, this k=
ey might not exist in older json files though
> +            default_remote =3D r_remote['default-remote']
> +            if not desc:
> +                desc =3D '{}/{}'.format(default_remote, branch)
> +        else:
> +            if not desc:
> +                desc =3D rev[:10]
>
>          print('\nSetting up source {}, revision {}, branch {}'.format(r_=
name, desc, branch))
>          if not _is_repo_git_repo(repodir):
> @@ -84,16 +134,43 @@ def _do_checkout(args, json):
>                  print("Running '{}' in {}".format(cmd, repodir))
>                  subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir=
)
>
> -        if not _is_repo_at_rev(repodir, rev):
> +        if rev:
> +            if not _is_repo_at_rev(repodir, rev) or not _is_repo_at_head=
(repodir):
> +                cmd =3D "git fetch -q --all || true"
> +                print("Running '{}' in {}".format(cmd, repodir))
> +                subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir=
)
> +
> +                cmd =3D 'git checkout -q {}'.format(rev)
> +                print("Running '{}' in {}".format(cmd, repodir))
> +                subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir=
)
> +
> +                if _contains_submodules(repodir):
> +                    print("Repo {} contains submodules, use 'git submodu=
le update' to ensure they are up to date".format(repodir))
> +        else:
> +            check_submodule =3D False
> +
>              cmd =3D "git fetch -q --all || true"
>              print("Running '{}' in {}".format(cmd, repodir))
>              subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir)
>
> -            cmd =3D 'git checkout -q {}'.format(rev)
> -            print("Running '{}' in {}".format(cmd, repodir))
> -            subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir)
> +            if not _is_repo_at_default_remote(repodir, default_remote):
> +                cmd =3D 'git config checkout.defaultRemote {}'.format(de=
fault_remote)
> +                print("Running '{}' in {}".format(cmd, repodir))
> +                subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir=
)
> +
> +            if not _is_repo_at_branch(repodir, branch):
> +                cmd =3D 'git checkout -q {}'.format(branch)
> +                print("Running '{}' in {}".format(cmd, repodir))
> +                subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir=
)
> +                check_submodule =3D True
> +
> +            if not _is_repo_branch_latest(repodir):
> +                cmd =3D 'git pull'
> +                print("Running '{}' in {}".format(cmd, repodir))
> +                subprocess.check_output(cmd, shell=3DTrue, cwd=3Drepodir=
)
> +                check_submodule =3D True
>
> -            if _contains_submodules(repodir):
> +            if check_submodule and _contains_submodules(repodir):
>                  print("Repo {} contains submodules, use 'git submodule u=
pdate' to ensure they are up to date".format(repodir))
>
>  parser =3D argparse.ArgumentParser(description=3D"A self contained pytho=
n script that fetches all the needed layers and sets them to correct revisi=
ons using data in a json format from a separate file. The json data can be =
created from an active build directory with 'bitbake-layers create-layers-s=
etup destdir' and there's a sample file and a schema in meta/files/")
> --
> 2.42.0.windows.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188688): https://lists.openembedded.org/g/openembedde=
d-core/message/188688
> Mute This Topic: https://lists.openembedded.org/mt/101756511/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

