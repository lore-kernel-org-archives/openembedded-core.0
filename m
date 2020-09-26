Subject: Re: [PATCH] sysvinit rc: Use PSPLASH_FIFO_DIR for progress fifo
To: openembedded-core@lists.openembedded.org
From: mihai.lindner@gmail.com
X-Originating-Location: Bucharest, Bucuresti, RO (86.121.199.28)
X-Originating-Platform: Linux Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 26 Sep 2020 04:27:52 -0700
References: <20200829030901.488431-1-mgloff@emacinc.com>
In-Reply-To: <20200829030901.488431-1-mgloff@emacinc.com>
Message-ID: <27286.1601119672816825649@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Please backport this to dunfell.

Thanks,
Mihai

On Sat, Aug 29, 2020 at 06:09 AM, Michael Gloff wrote:

>
> psplash expects the fifo to be in /run or specified
> by PSPLASH_FIFO_DIR. This patch allows psplash to
> quit normally. Also, fix the work around of using
> echo directly into the fifo and use psplash-write.
>=20
> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit/rc | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit/rc
> b/meta/recipes-core/sysvinit/sysvinit/rc
> index 7ca41ae1ae..fd1fdd26ba 100755
> --- a/meta/recipes-core/sysvinit/sysvinit/rc
> +++ b/meta/recipes-core/sysvinit/sysvinit/rc
> @@ -26,11 +26,8 @@ startup_progress() {
>          progress=3D$progress_size
>      fi
>      #echo "PROGRESS is $progress $runlevel $first_step + ($step of
> $num_steps) $step_change $progress_size"
> -    #if type psplash-write >/dev/null 2>&1; then
> -    #    TMPDIR=3D/mnt/.psplash psplash-write "PROGRESS $progress" || t=
rue
> -    #fi
> -    if [ -e /mnt/.psplash/psplash_fifo ]; then
> -        echo "PROGRESS $progress" > /mnt/.psplash/psplash_fifo
> +    if type psplash-write >/dev/null 2>&1; then
> +        PSPLASH_FIFO_DIR=3D/mnt/.psplash psplash-write "PROGRESS $progr=
ess" ||
> true
>      fi
>  }
>  
> @@ -176,7 +173,7 @@ startup() {
>  #Uncomment to cause psplash to exit manually, otherwise it exits when i=
t sees
> a VC switch
>  if [ "x$runlevel" !=3D "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver=
-nodm ];
> then
>      if type psplash-write >/dev/null 2>&1; then
> -        TMPDIR=3D/mnt/.psplash psplash-write "QUIT" || true
> +        PSPLASH_FIFO_DIR=3D/mnt/.psplash psplash-write "QUIT" || true
>      	umount -l /mnt/.psplash
>      fi
>  fi
> --=20
> 2.28.0
>=20
>
