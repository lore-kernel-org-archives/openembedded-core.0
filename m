Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0E22F6E766
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:54:57 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wo20so305779obc.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HU58QUe8O1vgW3LYQU+waytlYV8Jhhem315tgCFNhfw=;
	b=uElFGIT6DtkIngk+2iew+c3u+fKHczP3jZd68LkWVWNVVLl17KFCkPwCOfatHC3JsP
	xVo+czmYlZVdf8QZSstB7osh14GUa42PUXKz8PLmh9P0lVb/ADsjpHu+qILtx7PsnhTo
	1xCDW8zoTAq4VQ8Z5ZF7whrh+5oPXoy8jVMPGJwMwDlAgjXJyC1Vq0Fd3sVdbRMlVi0u
	CtpKQn0vUnmJX/lteI6TmQjiDaA4SlRsJlv+5IVPO7/YxJSGJOkee3tibNdvIMxKgQzK
	mXRdBAI15cCYvFVrXkhPJh9puTgul6Wr3NT/sCb7lUxAeCI5AXX8n0h9Hu+zXnu1IDdu
	wjXg==
X-Received: by 10.182.176.10 with SMTP id ce10mr30914190obc.31.1395744897898; 
	Tue, 25 Mar 2014 03:54:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.116.194 with HTTP; Tue, 25 Mar 2014 03:54:37 -0700 (PDT)
In-Reply-To: <1395739175.24890.19.camel@ted>
References: <1394724708-9894-1-git-send-email-ricardo.ribalda@gmail.com>
	<1395737416.24890.16.camel@ted>
	<CAPybu_11Uv2dt9g=kWQr6EctraGHSZ_1V_yJA+ovPhdEe9DL2g@mail.gmail.com>
	<1395739175.24890.19.camel@ted>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 25 Mar 2014 11:54:37 +0100
Message-ID: <CAPybu_3Fcm=StTOV6efswhAg-wpW5YdBRBHMVLVrhRR67khTog@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_deb: Remove version from Provides Field
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
X-List-Received-Date: Tue, 25 Mar 2014 10:54:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

ok, but for the next release wont be a good idea to fix the warning in dpkg?

On Tue, Mar 25, 2014 at 10:19 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-03-25 at 09:54 +0100, Ricardo Ribalda Delgado wrote:
>> Hello Richard
>>
>> It is ok to have Provides, but they should not have a version number.
>> If they have a version number a nasty warning appears (as you can see
>> on the patch). The provided patch just clears all the versions but
>> keeps the Provides
>>
>> We could "fix" dpkg to support versioning, but I believe it is better
>> to just remove the version number from the Provides.
>
> We can also do the version comparison in package_deb.bbclass itself. I
> believe there is some code somewhere which can understand the different
> constraints.
>
> Cheers,
>
> Richard
>
>> Cheers!
>>
>> On Tue, Mar 25, 2014 at 9:50 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2014-03-13 at 16:31 +0100, Ricardo Ribalda Delgado wrote:
>> >> According to Debian Policy Manual. Chapter 7.1
>> >>
>> >> All of the fields except for Provides may restrict their applicability
>> >> to particular versions of each named package. This is done in
>> >> parentheses after each individual package name; the parentheses should
>> >> contain a relation from the list below followed by a version number, in
>> >> the format described in Version, Section 5.6.12.
>> >>
>> >> This Fixes the following warning:
>> >>
>> >> root@qt5022:~# apt-get update
>> >>
>> >> ...
>> >>
>> >> Reading package lists... Done
>> >> W: Ignoring Provides line with DepCompareOp for package
>> >> pkgconfig__pkg-config__
>> >> W: You may want to run apt-get update to correct these problems
>> >>
>> >> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> >> ---
>> >>  meta/classes/package_deb.bbclass | 8 ++++++++
>> >>  1 file changed, 8 insertions(+)
>> >>
>> >> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
>> >> index 2d2f3f1..905af24 100644
>> >> --- a/meta/classes/package_deb.bbclass
>> >> +++ b/meta/classes/package_deb.bbclass
>> >> @@ -322,6 +322,13 @@ python do_package_deb () {
>> >>
>> >>          mapping_rename_hook(localdata)
>> >>
>> >> +        def debian_cmp_purgeversion(var):
>> >> +            # dpkg does not allow versions on Provides.
>> >> +            # From Debian Policy Manual, Chapter 7:
>> >> +            # All of the fields except for Provides may restrict their applicability to particular versions of each named package.
>> >> +            for key in var:
>> >> +                var[key] = []
>> >> +
>> > Shouldn't this actually make a version comparison, i.e. if <condition>
>> > then emit the Provides, otherwise don't (looking at the package version
>> > for comparison)?
>> >
>> > I can imagine having multiple versions of a recipe, some with provides
>> > and some without, all using the same code.
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >          def debian_cmp_remap(var):
>> >>              # dpkg does not allow for '(' or ')' in a dependency name
>> >>              # replace these instances with '__' and '__'
>> >> @@ -359,6 +366,7 @@ python do_package_deb () {
>> >>          debian_cmp_remap(rsuggests)
>> >>          rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
>> >>          debian_cmp_remap(rprovides)
>> >> +        debian_cmp_purgeversion(rprovides)
>> >>          rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
>> >>          debian_cmp_remap(rreplaces)
>> >>          rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
>> >
>> >
>>
>>
>>
>
>



-- 
Ricardo Ribalda

