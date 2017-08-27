Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 97F6D6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 16:03:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7RG17NS013269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 27 Aug 2017 17:01:08 +0100
Message-ID: <1503849667.32591.272.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@intel.com>, Trevor Woerner
	<twoerner@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, seebs@seebs.net
Date: Sun, 27 Aug 2017 17:01:07 +0100
In-Reply-To: <e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
	<96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
	<CAHUNapRMGUyRN0omktP7x2sgk1QuHh9C-j13Am4Wo3eWYe04=w@mail.gmail.com>
	<e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 27 Aug 2017 17:01:09 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: long (never ending?) do_install for adwaita-icon-theme
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Aug 2017 16:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-23 at 15:46 +0300, Alexander Kanavin wrote:
> On 08/22/2017 09:46 PM, Trevor Woerner wrote:
> >=20
> > >=20
> > > Do you have any kind of logs for when it happens?
> >=20
> > Unfortunately not, I'll try to keep some the next time it happens.
> >=20
> > But I have a suspicion it might be related to a build failure.
> > Earlier
> > today I was doing a build which failed in a recipe that wasn't
> > adwaita-icon-theme, nor related to it. When I checked on my build
> > later I could see the tail of the error message from the failed
> > recipe, but the overall build was still waiting for
> > adwaita-icon-theme's do_install to finish (hours after the
> > failure).
> >=20
> > Maybe adwaita-icon-theme's do_install would have succeeded if
> > everything had gone well? Maybe to reproduce, it might be necessary
> > to
> > time it such that another recipe fails while adwaita-icon-theme is
> > building?
> We can certainly revert my patch that speeds up the do_install(), but
> I=C2=A0
> would prefer not to do it blindly: it's much better to first firmly=C2=A0
> establish that the patch is indeed the reason for the never ending=C2=A0
> do_install (I can't imagine why, but it certainly could be). So
> please=C2=A0
> do try to get some logs, or a stable way to reproduce.

The autobuilder hung with this issue on the debian8 worker:

https://autobuilder.yocto.io/builders/nightly-rpm-non-rpm/builds/435

I was able to ssh in and take a look at what was going on. Basically
its hung in connecting to pseudo. I did a little debugging whilst it
was hung:

The process list is a long list of forked off copies of install-sh
which in turn call chmod and cp of which there are a ton of jammed
processes.

$ ps ax | grep "cp " | wc
=C2=A0=C2=A0=C2=A0=C2=A0272=C2=A0=C2=A0=C2=A0=C2=A01903=C2=A0=C2=A0=C2=A081=
859
$ ps ax | grep "chmod " | wc
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A099=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0692=C2=A0=C2=
=A0=C2=A022472
$ ps ax | grep "install-sh " | wc
=C2=A0=C2=A0=C2=A0=C2=A0508=C2=A0=C2=A0=C2=A0=C2=A05638=C2=A0=C2=A0252481

$ grep 33196 /home/rpurdie/pslog33196 ?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0SN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00:00 chmod 644 /home/pokybuild/=
yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all=
-poky-linux/adwaita-icon-theme/3.24.0-r0/image/usr/share/icons/Adwaita//./3=
2x32/status/_inst.29542_

$ strace -p 33196
Process 33196 attached
connect(22, {sa_family=3DAF_LOCAL, sun_path=3D"pseudo.socket"}, 110

$ grep 29542 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non=
-rpm/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/3.24.0-r0/pseud=
o/pseudo.log
[i.e. no match]

$ grep 33208 /home/rpurdie/pslog
33208 ?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SN=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00:00 chmod 644 /home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-rpm-non-rpm/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/3=
.24.0-r0/image/usr/share/icons/Adwaita//./32x32/mimetypes/_inst.29870_

$ strace -p 33208
Process 33208 attached
connect(22, {sa_family=3DAF_LOCAL, sun_path=3D"pseudo.socket"}, 110

$ ps ax | grep pseudo
19251 ?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0S=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A00:00 /home/pokybuild/yocto-autobuilder/yocto-worker/night=
ly-rpm-non-rpm/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr=
/bin/pseudo bitbake-worker decafbadbeef
43675 ?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Ss=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00:13 /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm=
-non-rpm/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/p=
seudo -d

$ strace -p 43675
Process 43675 attached
read(1025,

$ ls -la /proc/43675/fd | grep socket | wc
=C2=A0=C2=A0=C2=A0=C2=A0486=C2=A0=C2=A0=C2=A0=C2=A05346=C2=A0=C2=A0=C2=A034=
471
$ ls -la /proc/43675/fd | grep -v socket
total 0
dr-x------ 2 pokybuild users=C2=A0=C2=A00 Aug 27 15:12 .
dr-xr-xr-x 9 pokybuild users=C2=A0=C2=A00 Aug 27 08:47 ..
lrwx------ 1 pokybuild users 64 Aug 27 15:12 0 -> /dev/null
lrwx------ 1 pokybuild users 64 Aug 27 15:12 1 -> /dev/null
l-wx------ 1 pokybuild users 64 Aug 27 15:12 2 -> /home/pokybuild/yocto-aut=
obuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-poky-lin=
ux/adwaita-icon-theme/3.24.0-r0/pseudo/pseudo.log
l-wx------ 1 pokybuild users 64 Aug 27 15:12 3 -> /home/pokybuild/yocto-aut=
obuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-poky-lin=
ux/adwaita-icon-theme/3.24.0-r0/pseudo/pseudo.log
lrwx------ 1 pokybuild users 64 Aug 27 15:12 4 -> /home/pokybuild/yocto-aut=
obuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-poky-lin=
ux/adwaita-icon-theme/3.24.0-r0/pseudo/pseudo.lock
lrwx------ 1 pokybuild users 64 Aug 27 15:12 6 -> /home/pokybuild/yocto-aut=
obuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-poky-lin=
ux/adwaita-icon-theme/3.24.0-r0/pseudo/logs.db
lrwx------ 1 pokybuild users 64 Aug 27 15:12 7 -> /home/pokybuild/yocto-aut=
obuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-poky-lin=
ux/adwaita-icon-theme/3.24.0-r0/pseudo/files.db

So it has 486 sockets connected and very little else open as fds.

$ ls -la /proc/43675/fd | grep 1025
lrwx------ 1 pokybuild users 64 Aug 27 15:12 1025 -> socket:[111861392]

$ ss=C2=A0=C2=A0-p | grep 1392
u_str=C2=A0=C2=A0ESTAB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pseud=
o.socket 111861392=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* 111831542 users:(("pseudo",pid=3D43675,f=
d=3D1025))
u_str=C2=A0=C2=A0ESTAB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* 1118=
31542=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0* 111861392 users:(("bash",pid=3D32133,fd=3D22))

$ strace -p 32133
Process 32133 attached
read(3,=20

$ ls -la /proc/32133/fd
total 0
dr-x------ 2 pokybuild users=C2=A0=C2=A00 Aug 27 15:15 .
dr-xr-xr-x 9 pokybuild users=C2=A0=C2=A00 Aug 27 08:51 ..
lr-x------ 1 pokybuild users 64 Aug 27 15:16 0 -> /dev/null
l-wx------ 1 pokybuild users 64 Aug 27 15:16 1 -> pipe:[111501676]
l-wx------ 1 pokybuild users 64 Aug 27 15:16 2 -> pipe:[111501676]
lr-x------ 1 pokybuild users 64 Aug 27 15:16 20 -> /home/pokybuild/yocto-au=
tobuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/sysroots-compone=
nts/x86_64/pseudo-native/usr
lr-x------ 1 pokybuild users 64 Aug 27 15:16 21 -> /home/pokybuild/yocto-au=
tobuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-poky-li=
nux/adwaita-icon-theme/3.24.0-r0/pseudo
lrwx------ 1 pokybuild users 64 Aug 27 15:16 22 -> socket:[111831542]
lr-x------ 1 pokybuild users 64 Aug 27 15:16 255 -> /home/pokybuild/yocto-a=
utobuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-poky-l=
inux/adwaita-icon-theme/3.24.0-r0/adwaita-icon-theme-3.24.0/install-sh
lr-x------ 1 pokybuild users 64 Aug 27 15:16 3 -> pipe:[111853934]

$ ls -la /proc/*/fd/ | grep 111853934

leads to process 33197

$ ps ax | grep 33197
33197 ?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SN=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A00:00 /bin/bash /home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-rpm-non-rpm/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/3=
.24.0-r0/adwaita-icon-theme-3.24.0/install-sh -c -m 644 ../../../adwaita-ic=
on-theme-3.24.0/Adwaita//./32x32/actions/media-eject.png /home/pokybuild/yo=
cto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/build/tmp/work/all-p=
oky-linux/adwaita-icon-theme/3.24.0-r0/image/usr/share/icons/Adwaita//./32x=
32/actions/media-eject.png

$ strace -p 33197
Process 33197 attached
connect(22, {sa_family=3DAF_LOCAL, sun_path=3D"pseudo.socket"}, 110

I then decided I couldn't really get much more from this and ran strace
against the pseudo server whilst I killed 32133. This gave:

read(1025, "\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\205}\0\0\0\0\0\0\0\0\0\0\0\0\0=
\0"..., 76) =3D 76
read(1025, "/bin/bash\0", 10)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=3D 10
rt_sigaction(SIGPIPE, {0x40f420, [PIPE], SA_RESTORER|SA_RESTART, 0x7f2a17a1=
8060}, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7f2a17a18060}, 8) =3D 0
write(1025, "\4\0\0\0\0\0\0\0\2\0\0\0\0\0\0\0\372\3\0\0\0\0\0\0\0\0\0\0\0\0=
\0\0"..., 76) =3D 76
rt_sigaction(SIGPIPE, {SIG_IGN, [PIPE], SA_RESTORER|SA_RESTART, 0x7f2a17a18=
060}, {0x40f420, [PIPE], SA_RESTORER|SA_RESTART, 0x7f2a17a18060}, 8) =3D 0
accept(5, {sa_family=3DAF_LOCAL, NULL}, [2]) =3D 22
select(1026, [5 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 27 30 31 32 3=
4 35 37 42 43 45 47 52 53 54 56 58 59 60 89 92 94 95 99 100 131 138 141 143=
 144 145 146 148 149 152 156 159 160 165 166 170 171 173 185 186 187 188 19=
0 191 192 194 197 199 200 201 202 204 206 207 208 209 211 212 213 215 216 2=
19 220 221 222 223 224 227 228 230 231 234 236 238 241 243 244 245 246 248 =
249 252 253 254 259 260 261 262 263 264 265 272 273 274 279 280 281 282 284=
 285 286 287 288 289 290 291 293 295 296 297 299 300 301 302 303 304 309 31=
1 314 315 318 320 321 322 323 324 325 326 327 328 330 331 332 333 334 339 3=
40 341 343 345 347 348 350 354 355 356 357 360 361 362 364 365 366 367 368 =
369 372 373 374 375 376 378 379 381 382 383 388 389 390 391 393 394 395 400=
 403 409 410 411 417 420 425 431 434 443 455 460 467 485 556 577 578 581 59=
0 593 594 595 596 597 598 599 600 601 602 603 604 605 606 607 608 609 610 6=
11 612 613 614 615 616 617 618 619 620 621 622 623 624 625 626 627 629 631 =
635 637 638 639 640 641 642 646 647 650 652 653 654 655 656 659 661 662 664=
 666 667 669 670 671 674 675 676 681 682 683 685 687 688 691 692 693 694 69=
5 696 698 702 703 704 705 706 709 710 711 712 713 714 715 716 718 719 721 7=
22 724 728 736 738 751 752 754 755 756 757 758 759 760 761 763 764 765 766 =
767 768 769 770 771 772 773 774 775 776 777 778 780 781 782 783 784 785 786=
 787 788 790 792 793 794 795 796 798 799 800 802 803 804 805 806 807 811 81=
3 814 815 817 818 819 820 821 823 826 827 829 832 836 838 839 840 841 842 8=
43 844 845 846 847 848 849 850 851 852 853 854 855 856 857 858 859 860 861 =
862 863 864 865 866 867 868 869 870 871 873 875 878 879 881 882 884 885 886=
 888 889 890 891 892 893 894 895 896 897 898 899 905 906 907 908 909 910 91=
1 912 913 914 915 916 917 918 919 923 925 928 929 930 931 932 934 935 937 9=
39 942 943 951 955 957 959 960 961 962 963 964 965 966 968 970 971 972 973 =
974 990 995 997 1005 1013 1017 1020 1022 1023 1025], [1], [5 8 9 10 11 12 1=
3 14 15 16 17 18 19 20 21 22 23 27 30 31 32 34 35 37 42 43 45 47 52 53 54 5=
6 58 59 60 89 92 94 95 99 100 131 138 141 143 144 145 146 148 149 152 156 1=
59 160 165 166 170 171 173 185 186 187 188 190 191 192 194 197 199 200 201 =
202 204 206 207 208 209 211 212 213 215 216 219 220 221 222 223 224 227 228=
 230 231 234 236 238 241 243 244 245 246 248 249 252 253 254 259 260 261 26=
2 263 264 265 272 273 274 279 280 281 282 284 285 286 287 288 289 290 291 2=
93 295 296 297 299 300 301 302 303 304 309 311 314 315 318 320 321 322 323 =
324 325 326 327 328 330 331 332 333 334 339 340 341 343 345 347 348 350 354=
 355 356 357 360 361 362 364 365 366 367 368 369 372 373 374 375 376 378 37=
9 381 382 383 388 389 390 391 393 394 395 400 403 409 410 411 417 420 425 4=
31 434 443 455 460 467 485 556 577 578 581 590 593 594 595 596 597 598 599 =
600 601 602 603 604 605 606 607 608 609 610 611 612 613 614 615 616 617 618=
 619 620 621 622 623 624 625 626 627 629 631 635 637 638 639 640 641 642 64=
6 647 650 652 653 654 655 656 659 661 662 664 666 667 669 670 671 674 675 6=
76 681 682 683 685 687 688 691 692 693 694 695 696 698 702 703 704 705 706 =
709 710 711 712 713 714 715 716 718 719 721 722 724 728 736 738 751 752 754=
 755 756 757 758 759 760 761 763 764 765 766 767 768 769 770 771 772 773 77=
4 775 776 777 778 780 781 782 783 784 785 786 787 788 790 792 793 794 795 7=
96 798 799 800 802 803 804 805 806 807 811 813 814 815 817 818 819 820 821 =
823 826 827 829 832 836 838 839 840 841 842 843 844 845 846 847 848 849 850=
 851 852 853 854 855 856 857 858 859 860 861 862 863 864 865 866 867 868 86=
9 870 871 873 875 878 879 881 882 884 885 886 888 889 890 891 892 893 894 8=
95 896 897 898 899 905 906 907 908 909 910 911 912 913 914 915 916 917 918 =
919 923 925 928 929 930 931 932 934 935 937 939 942 943 951 955 957 959 960=
 961 962 963 964 965 966 968 970 971 972 973 974 990 995 997 1005 1013 1017=
 1020 1022 1023 1025], {2, 0}) =3D 31 (in [5 15 17 18 19 20 22 89 131 149 1=
59 187 434 460 467 485 556 635 654 675 696 990 995 997 1013 1017 1020 1022 =
1023 1025], out [1], left {1, 999780})
read(15, "\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;a\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..=
., 76) =3D 76
read(15, "cp\0", 3)

and it then closed the connection on 1025 shortly thereafter.

I was thinking it might have been stuck with a large pseudo request,
maybe bigger than page size but that doesn't seem to be the case.

seebs: Any idea why pseudo could end up blocking in a read()?

Cheers,

Richard
=C2=A0=C2=A0



