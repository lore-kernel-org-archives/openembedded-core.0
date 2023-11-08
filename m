Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DE8C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:52:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.10844.1699440731261441795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 02:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g8dYFRVH;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso92647481fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699440729; x=1700045529; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAbwCvP6m1LC4GOMJaoYKlJ4/xyj0r1AqQTUQqNLQdg=;
        b=g8dYFRVHCqoAo6QRSm0uj7cPRIxFrYOSeVsdtu0wNcklCUb3tS+d/QG2Qoq6qRhvCu
         DtDZ9WZmnZvvgCuWU2Wna5HMaiqbntWuSLWVwTtITR5Az4F1x/w44rALNMcDB8Wvr6Et
         K7U6OPXS26qfNn1xbNW6jLzNHJYRSrRC256u1wXXLusz6ReZ8Yq9xSRoWZgaV2WTSPzc
         +OiL+ia5Pzd6izdjk7PZqP95eo4v1e0nRwSgwspKdSoeuooSp1fRbLcxG9rfr51ZwsZc
         n5Fv9YDm0ADhsWbk91K/RV0srFvbwfnPSlkXNidVKx41z73n+k3kSV6GLdUvNiRdVUlq
         vHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440729; x=1700045529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAbwCvP6m1LC4GOMJaoYKlJ4/xyj0r1AqQTUQqNLQdg=;
        b=wJ7OaGlMLPTG4j1A0Yv7ayhfYfI/plvbCsFhvYgn0rX35OdUH8fB2QeLNq8bv+yeEv
         0oj7lQX29sC2xtglFrT8U3/SecId+LTaZs5Mml/GZYCxO0aACt4ums+jhidEmCHMI6nv
         qYpD0s2fSms7KC7VCY2nMCA6qcuXi7n25GAABqDLvoFKAZIfqh2z5cJT9/locw4F10ml
         sunZLgH0dEyd4LXg9yZT03n8yUzBDxrjjEnrL1QHvRJVq0oOQ3TOCGdrAjZ+Ss8GGI2m
         P+1nKOBOkoBaspJOVHLNJGr4s+NDR/yIWt+NjPHmxWM/okkyeaptdVwx5kQzdhZSgv6C
         hAtw==
X-Gm-Message-State: AOJu0YyDIadDIhAXoxKBxsep8vZ8vqpBrjVcLX3pmkl6IeMvT17jBswA
	xujAlWu/pYVLAKrkZXgLtshY9orGz4OpjogyGrI=
X-Google-Smtp-Source: AGHT+IHcZdSOzTs4WKqZfe1+KGNhm4GBA/rWsLFDh7vBnOCsrhQMediIHQxr5a5MsllM0+6dC4bwNwPB4NKZi6fYhEk=
X-Received: by 2002:a05:6512:504:b0:509:493a:7d64 with SMTP id
 o4-20020a056512050400b00509493a7d64mr899264lfb.41.1699440729195; Wed, 08 Nov
 2023 02:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20231107152641.1043-2-jermain.horsman@nedap.com> <20231107152641.1043-3-jermain.horsman@nedap.com>
In-Reply-To: <20231107152641.1043-3-jermain.horsman@nedap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Nov 2023 11:51:57 +0100
Message-ID: <CANNYZj-Q5nnTAx_LnHs1qPkECsOC8RutPbZs2NuJEL9y6B+Uow@mail.gmail.com>
Subject: Re: [OE-core] [RFC 1/7] scripts/oe-setup-layers: Allow setup using
 branches instead of fixed revisions
To: jermain.horsman@nedap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 10:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190314

Is it possible to simply run a single 'git checkout' command to get
the repo checkout to what the json prescribes? I have to say I really
don't like the combinatorial explosion of possible code paths here.
Can't anymore understand what is going on.

Alex




On Tue, 7 Nov 2023 at 16:27, Jermain Horsman <jermain.horsman@nedap.com> wr=
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
>  scripts/oe-setup-layers | 91 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 84 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
> index 6d49688a32..ac9a9f139b 100755
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
> View/Reply Online (#190291): https://lists.openembedded.org/g/openembedde=
d-core/message/190291
> Mute This Topic: https://lists.openembedded.org/mt/102444602/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

