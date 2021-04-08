Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.1821.1617844517874546980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 18:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.182.87])
	by smtp0.taitradio.net (Postfix) with ESMTP id 0EAACE07F7;
	Thu,  8 Apr 2021 13:09:10 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH 0/2] externalsrc: Detect code changes in submodules
Date: Thu,  8 Apr 2021 13:08:53 +1200
Message-Id: <20210408010855.345237-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

The (undocumented) git submodule--helper returns a path
for each submodule relative to the top of the repo.
Don't add submodules that are not within our EXTERNALSRC subtree.

If we unpack one git repo inside another, like this:

    SRC_URI =3D "git://${GIT_SERVER}/repo1;name=3Drepo1;destsuffix=3Drepo=
1 \
               git://${GIT_SERVER}/repo2;name=3Drepo2;destsuffix=3Drepo1/=
repo2 \
               "

Git status reports, for repo1:

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    	repo2/

If we run `devtool modify` on this recipe, do_patch runs with:

    PATCHTOOL =3D "git"
    PATCH_COMMIT_FUNCTIONS =3D "1"

The `patch_task_postfunc` (patch.bbclass, line 82) runs a `git add .` on =
the
top-level repo1, leaving the checkout in an invalid state. The following =
git
warning does not appear in the log:

    $ git add .
    warning: adding embedded git repository: repo2
    hint: You've added another git repository inside your current reposit=
ory.
    hint: Clones of the outer repository will not contain the contents of
    hint: the embedded repository and will not know how to obtain it.
    hint: If you meant to add a submodule, use:
    hint:
    hint: 	git submodule add <url> repo2
    hint:
    hint: If you added this path by mistake, you can remove it from the
    hint: index with:
    hint:
    hint: 	git rm --cached repo2
    hint:
    hint: See "git help submodule" for more information.

    $ git submodule status
    fatal: no submodule mapping found in .gitmodules for path 'repo2'

No further git submodule commands can be run on the checkout.

We could enhance the `patch_task_postfunc` to look for any embedded git
checkouts and add them as submodules, but this seems unnecessary complexi=
ty for
an obscure edge-case. Although the git repo is left in an invalid state w=
ith
respect to the submodules, it still serves the purpose required by devtoo=
l:
To take further commits, and generate patch files from them.

We are still able to run these commands to examine any submodules,
where git submodule--helper reports paths relative to the top of the chec=
kout:

    $ git ls-files --stage | grep ^160000
    160000 5feee12d6e974dd8c0614cf5b593380b046439a5 0   repo2

    $ git submodule--helper list
    160000 5feee12d6e974dd8c0614cf5b593380b046439a5 0   repo2

When a recipe sets EXTERNALSRC to a subdirectory of the git checkout, we =
test
for the existence of the reported submodule paths within the EXTERNALSRC
directory.

The latest versions of git submodule--helper accept a path to a subdirect=
ory and
correctly report no submodules within that subdirectory. Regrettably, we =
still
support git versions that don't accept a path to a subdirectory.

[YOCTO #14333]

Douglas Royds (2):
  Revert "externalsrc: Detect code changes in submodules"
  externalsrc: Detect code changes in submodules

 meta/classes/externalsrc.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

--=20
2.25.1

