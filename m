Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44FF760557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:00:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9VA0rxh006514
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Oct 2014 03:00:53 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.16]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Fri, 31 Oct 2014 03:00:52 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Thread-Topic: [OE-core] [PATCH] gcc: fix ICE in dwarf2out_var_location
Thread-Index: AQHP836twBh8poLO8U2zfpV2Q4IoipxJ+ZTQ
Date: Fri, 31 Oct 2014 10:00:52 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD54181C@ALA-MBA.corp.ad.wrs.com>
References: <1414550044-1427-1-git-send-email-jackie.huang@windriver.com>
	<CAMKF1sqH9mGSoXaZkbSBy0rpFoDDHp2UhaFW-G53ogx3VueHEg@mail.gmail.com>
	<5450C8AA.9070305@pabigot.com>	<5450E88E.5090105@windriver.com>
	<5450EC54.4000708@windriver.com> <5450EF4B.8070705@pabigot.com>
In-Reply-To: <5450EF4B.8070705@pabigot.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: fix ICE in dwarf2out_var_location
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
X-List-Received-Date: Fri, 31 Oct 2014 10:00:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Peter A. Bigot
> Sent: Wednesday, October 29, 2014 9:45 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] gcc: fix ICE in dwarf2out_var_location
>=20
> On 10/29/2014 08:32 AM, Mark Hatle wrote:
> > On 10/29/14, 8:15 AM, Mark Hatle wrote:
> >> On 10/29/14, 5:59 AM, Peter A. Bigot wrote:
> >>> On 10/28/2014 10:41 PM, Khem Raj wrote:
> >>>> On Tue, Oct 28, 2014 at 7:34 PM, <jackie.huang@windriver.com> wrote:
> >>>>> From: Jackie Huang <jackie.huang@windriver.com>
> >>>>>
> >>>>> Fixed the ICE:
> >>>>> internal compiler error: in dwarf2out_var_location, at
> >>>>> dwarf2out.c:21261
> >>>>>
> >>>> this looks ok. but we need the test case too. and a nit more
> >>>> documentation
> >>>
> >>> Agreed.  We're getting a lot of Wind River patches these days that
> >>> are pretty sparse on context and justification.
> >>>
> >>> For backport patches to GCC and most other projects, I'd really love
> >>> to see them provided by cloning the upstream repository and using
> >>> format-patch on the upstream commit that's being backported. This
> >>> practice of discarding all that relevant information in favor of a
> >>> terse
> >>
> >> I just want to be clear the information isn't being discarded or
> >> "removed".  The original work is being done by taking the latest
> >> tree, and diffing sections of the code to find a relevant fix -- or
> >> looking in the mailing list for discussions on similar problems.
> >>
> >> Also as far as I know the upstream gcc repository is still SVN, so
> >> the "format-patch" git methods don't work.  Yes, I know there are
> >> people who have converted the GCC SVN to git, but these are not
> >> canonical sources -- so I'm not sure that is really an acceptable
> >> place to work.
> >>
> >> See: https://gcc.gnu.org
> >> "Our sources are readily and freely available via SVN and weekly
> >> snapshots."
> >
> > Just to follow up, there is an apparently undocumented git mirror of
> > the SVN on the GNU site.  I still don't know if it's a canonical
> > source, but since it's on the GNU website, I'd have to assume it is.
> >
> > git://gcc.gnu.org/git/gcc.git
>=20
> Yes, that's the one I was referring to.  It's the source of the gcc backp=
ort patches I've added to OE.
>=20
> Using it, the specific fix referenced has apparently not been backported =
to gcc-4_9-branch.
>=20
> Nor does it appear in trunk.
>=20
> Trunk has 5e9c670f06b9eaa52db639b888e0b0d15ba864c1 which may or may not b=
e fixing the same
> bug, but is definitely not this patch.

Yeah, it's not, sorry that the patch I sent is not upstream, the status is =
wrong, it is actually an early version
we were using. The upstream version fix for this issue is:
https://gcc.gnu.org/viewcvs/gcc?view=3Drevision&revision=3D212171

but it introduced a regression issue:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63348

which has been fixed by:
https://gcc.gnu.org/viewcvs/gcc?view=3Drevision&revision=3D215613

so I will send v2 with backporting these two patches.

Thanks,
Jackie

>=20
> So I'd have to say that, if the submitted patch is a backport, then all t=
he upstream context required to
> understand it has indeed been removed, and this patch to OE should be ret=
racted.
>=20
> >
> > (I really wish GNU would get away from SVN...)
>=20
> Ditto, but it's unlikely to happen.  Too big an impact to too many
> people.  That mirror is what I've used for gcc work for a couple years no=
w.
>=20
> Peter
>=20
> >
> > --Mark
> >
> >>> submitter-defined description makes it difficult to keep the OE patch
> >>> set current on upstream updates and trust in the appropriateness of t=
he
> >>> patch.  Add only your sign-off and the Upstream-Status with a referen=
ce
> >>> to the upstream bugreport.
> >>
> >> As for the other component critiques, I agree.. the message needs more
> >> information, and if possible more information on what the backport
> >> actually
> >> originated from is needed as well.  This example is terse at best and
> >> generally
> >> not acceptable.
> >>
> >> --Mark
> >>
> >>> You might look at gcc-4.9's OE patch
> >>> 0055-PR-rtl-optimization-61801.patch for an example.
> >>>
> >>> Peter
> >>>
> >>>>
> >>>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >>>>> ---
> >>>>>     meta/recipes-devtools/gcc/gcc-4.9.inc              | 1 +
> >>>>>     .../0058-gcc-ice-dwarf2out_var_location.patch      | 31
> >>>>> ++++++++++++++++++++++
> >>>>>     2 files changed, 32 insertions(+)
> >>>>>     create mode 100644
> >>>>> meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_locati=
on.patch
> >>>>>
> >>>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc
> >>>>> b/meta/recipes-devtools/gcc/gcc-4.9.inc
> >>>>> index 9a66cd2..89c405a 100644
> >>>>> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> >>>>> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> >>>>> @@ -71,6 +71,7 @@ SRC_URI =3D "\
> >>>>> file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
> >>>>>         file://0055-PR-rtl-optimization-61801.patch \
> >>>>>         file://0056-top-level-reorder_gcc-bug-61144.patch \
> >>>>> +    file://0058-gcc-ice-dwarf2out_var_location.patch \
> >>>>>     "
> >>>>>     SRC_URI[md5sum] =3D "fddf71348546af523353bd43d34919c1"
> >>>>>     SRC_URI[sha256sum] =3D
> >>>>> "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
> >>>>> diff --git
> >>>>> a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_loca=
tion.patch
> >>>>> b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_loca=
tion.patch
> >>>>>
> >>>>> new file mode 100644
> >>>>> index 0000000..28e7756
> >>>>> --- /dev/null
> >>>>> +++
> >>>>> b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-ice-dwarf2out_var_loca=
tion.patch
> >>>>> @@ -0,0 +1,31 @@
> >>>>> +From d358f8ba2e530850795adce19bd00b57139d9397 Mon Sep 17 00:00:00
> >>>>> 2001
> >>>>> +From: Baoshan Pang <baoshan.pang@windriver.com>
> >>>>> +Date: Tue, 16 Sep 2014 13:32:13 -0700
> >>>>> +Subject: [PATCH] Fix ICE in dwarf2out_var_location
> >>>>> +
> >>>>> +Upstream-Status: Backport
> >>>>> +
> >>>>> +Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
> >>>>> +---
> >>>>> + gcc/dwarf2out.c |    5 +++++
> >>>>> + 1 file changed, 5 insertions(+)
> >>>>> +
> >>>>> +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >>>>> +index 1df565b..0e1557d 100644
> >>>>> +--- a/gcc/dwarf2out.c
> >>>>> ++++ b/gcc/dwarf2out.c
> >>>>> +@@ -21255,6 +21255,11 @@ dwarf2out_var_location (rtx loc_note)
> >>>>> +       ca_loc->call_arg_loc_note =3D loc_note;
> >>>>> +       ca_loc->next =3D NULL;
> >>>>> +       ca_loc->label =3D last_label;
> >>>>> ++      while(prev && !CALL_P(prev) && !(GET_CODE (PATTERN (prev))
> >>>>> =3D=3D SEQUENCE
> >>>>> ++                                     && CALL_P (XVECEXP (PATTERN
> >>>>> (prev), 0, 0)))){
> >>>>> ++      gcc_assert(NONJUMP_INSN_P (prev));
> >>>>> ++      prev =3D prev_real_insn (prev);
> >>>>> ++      }
> >>>>> +       gcc_assert (prev
> >>>>> +                 && (CALL_P (prev)
> >>>>> +                     || (NONJUMP_INSN_P (prev)
> >>>>> +--
> >>>>> +1.7.9.5
> >>>>> +
> >>>>> --
> >>>>> 2.0.0
> >>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-core mailing list
> >>>>> Openembedded-core@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>
> >
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

