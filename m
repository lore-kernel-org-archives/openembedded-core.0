Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B859C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 06:57:48 +0000 (UTC)
Subject: Re: [PATCH 1/1] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
To: openembedded-core@lists.openembedded.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: IN (1.7.171.2)
X-Originating-Platform: Windows Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:57:40 -0700
References: <Z9xq+a9CuOr5heIs@gmail.com>
In-Reply-To: <Z9xq+a9CuOr5heIs@gmail.com>
Message-ID: <12701.1742540260916489571@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kVqKxxl6H49BsdakpNCS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213437

--kVqKxxl6H49BsdakpNCS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce, Thank you for your constructive feedback. Please find my inline r=
eplies.
FYI, I had submitted this v2 change before your comment on the previous ver=
sion, where you suggested to wait :| Thank you for considering this.

On Fri, Mar 21, 2025 at 12:52 AM, Bruce Ashfield wrote:

>=20
> In message: [OE-core] [PATCH 1/1] kernel-module-split: fix conf file
> generation when KERNEL_SPLIT_MODULES=3D0
> on 16/03/2025 Dixit Parmar via lists.openembedded.org wrote:
>=20
>=20
>> When KERNEL_SPLIT_MODULES=3D0 modprobe and autoload conf files are not
>> getting
>> generated for the kernel modules.
>>=20
>> Separated out conf file handling mechanism as handle_conf_files() functi=
on
>>=20
>> from hook frob_metadata() function. handle_conf_files() gets re-used fro=
m
>> the
>> existing hook function and add_conf_files function which got introduced
>> for
>> splitmods=3D0 flow in this patch.
>=20
> Trevor's advice on the commit message was excellent, I won't repeat
> it here. I'll just simply add that the commit message should give us
> all the information we need about the issue (and what its symptoms
> are) and how this fixes it (not explaining the code, but describing
> the strategy)

Understood. I will update the commit message with all these details.

>=20
>=20
>> [YOCTO #15145]
>>=20
>> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
>> Cc: George Thopas <george.thopas@gmail.com>
>> --
>> Can you show the conf files for the same kernel configuration
>> with and without the kernel_split_modules enabled ? That way
>> we know there's no change in existing behaviour.
>>=20
>>> I have confirmed that in my testing. Can you suggest how I can
>>=20
>> share that information here?
>=20
> A good way would simply to put it in the commit message that you've
> built and booted with both modes and that the generated module
> conf files are the same in both cases. Showing a diff command
> that you ran, or how you determined they were the same would be enough
> as well.

Agreed.

>=20
>=20
>> We also should make a test for this in the OE selftests. We
>> are adding conditional code paths, so they should be tested
>> to ensure no regressions in either in the future.
>>=20
>>> Never done that before. May be I can do it given some direction
>>=20
>> as separate patch.
>=20
> Any selftests should be in a separate patch, but they do need
> to come along with any new verions of this. Saying that "it will
> be send later" won't get the patches merged. Since everyone gets
> busy and these sorts of things tend to not happen.
>=20
> If you search on the mailing list(s) you'll find examples of
> other self tests being submitted. Just follow what they are
> doing. I'd suggest that a self test needs to run both modes
> and do a check that the generated .conf files are correct
> (basically what you'd be showing in the commit message). Even
> better if a boot and showing that they are (auto)loaded.
>=20
> That's the only way we can be sure this won't break in the
> future and be comfortable with the complexty being added.

Agree. I will look at the self-test implementations and develop the test fo=
r this too.

>=20
>=20
>> I'm curious about the above line. It is unclear to me why we'd
>> only have this postinst be relevant if none was previously set.
>>=20
>>> Reverted.
>>=20
>> Is there really a scenario where the directory won't exist ? Isn't
>> this just running in our own install phase ? So all prerequisites
>> and directories should be in place.
>>=20
>>> Ideally no, we kept it for safer side, I have added log warning.
>>=20
>>=20
>=20
> As Trevor mentioned in his reply, it is best to configure your
> mail client to reply inline. I had made that comment near the
> line of code in question, but with the time between my review,
> your reply and now this reply .. the context of what was being
> discussed is very difficult to remember.
>=20
> If that directory doesn't exist, just error out and do not
> continue. This isn't something recoverable, and the build should
> be stopped.

Okay. Will handle it that way.

>=20
>=20
>> The walking and sorting seems quite heavy. Isn't this called from
>> do_split_packages indirectly ?
>> Do we really need to walk and gather the information ? Is this mainly fo=
r
>> the case of no-split
>> on the kernel modules ? If that is the case, isn't there a way to short
>> circuit the processing
>> on the split-package case ?
>>=20
>>> Litterally I could not think of anything else here and not sure of ther=
e
>>=20
>> are any short-circuit options. I have limited knowledge in this. I am op=
en
>> to suggestions
>> if this is not the best solution at the moment.
>=20
> Describe the approach in your commit message, this is the type of
> information that we need. To be sure that it isn't adding a lot of
> time to the build, add some timing information with and without
> your changes. This is the type of information we are looking for
> in a review.

Understood.

>=20
> See a few more comments below.
>=20
>=20
>> ---
>> .../kernel-module-split.bbclass | 81 +++++++++++++++----
>> 1 file changed, 67 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
>> b/meta/classes-recipe/kernel-module-split.bbclass
>> index 9487365eb7..b7ee3a8f9e 100644
>> --- a/meta/classes-recipe/kernel-module-split.bbclass
>> +++ b/meta/classes-recipe/kernel-module-split.bbclass
>> @@ -86,11 +86,7 @@ python split_kernel_module_packages () {
>> vals[m.group(1)] =3D m.group(2)
>> return vals
>>=20
>> - def frob_metadata(file, pkg, pattern, format, basename):
>> - vals =3D extract_modinfo(file)
>> -
>> - dvar =3D d.getVar('PKGD')
>> -
>> + def handle_conf_files(d, basename, pkg):
>> # If autoloading is requested, output ${modulesloaddir}/<name>.conf and
>> append
>> # appropriate modprobe commands to the postinst
>> autoloadlist =3D (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()
>> @@ -101,7 +97,7 @@ python split_kernel_module_packages () {
>> bb.warn("module_autoload_%s is defined but '%s' isn't included in
>> KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
>> if basename in autoloadlist:
>> conf =3D '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
>> - name =3D '%s%s' % (dvar, conf)
>> + name =3D '%s%s' % (d.getVar('PKGD'), conf)
>> os.makedirs(os.path.dirname(name), exist_ok=3DTrue)
>> with open(name, 'w') as f:
>> if autoload:
>> @@ -123,7 +119,7 @@ python split_kernel_module_packages () {
>> modconf =3D d.getVar('module_conf_%s' % basename)
>> if modconf and basename in modconflist:
>> conf =3D '%s/%s.conf' % (d.getVar('modprobedir'), basename)
>> - name =3D '%s%s' % (dvar, conf)
>> + name =3D '%s%s' % (d.getVar('PKGD'), conf)
>> os.makedirs(os.path.dirname(name), exist_ok=3DTrue)
>> with open(name, 'w') as f:
>> f.write("%s\n" % modconf)
>> @@ -134,6 +130,63 @@ python split_kernel_module_packages () {
>> elif modconf:
>> bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF
>> since module_conf_%s is set" % (basename, basename))
>>=20
>> + def add_conf_files(d, root, file_regex, output_pattern):
>> + """
>> + Arguments:
>> + root -- the path in which to search
>> + file_regex -- regular expression to match searched files. Use
>> + parentheses () to mark the part of this expression
>> + that should be used to derive the module name (to be
>> + substituted where %s is used in other function
>> + arguments as noted below)
>> + output_pattern -- pattern to use for the package names. Must include %=
s.
>>=20
>> + """
>> +
>> + dvar =3D d.getVar('PKGD')
>> + root =3D d.expand(root)
>=20
> root is a passed parameter, you shouldn't need to call d.expand()
> on it. Are you expecting there to be something that can be expanded ?

>=20
>=20
>> + output_pattern =3D d.expand(output_pattern)
>=20
> Likewise with output_pattern

Correct. It's not needed as I don't expect it to be expanded. I missed it.

>=20
>=20
>> +
>> + # check if the root directory doesn't exist for safe side, don't error
>> out later but silently do
>> + # no splitting.
>> + if not os.path.exists(dvar + root):
>> + bb.warn("kernel module root directory path does not exist")
>> + return []
>=20
> as I mentioned above, I see this as a fatal error. Something has gone
> terribly wrong if this doesn't exist and we should error and exit.
>=20
>=20
>> +
>> + # get list of modules
>> + objs =3D []
>> + for walkroot, dirs, files in os.walk(dvar + root):
>> + for file in files:
>> + relpath =3D os.path.join(walkroot, file).replace(dvar + root + '/', ''=
, 1)
>>=20
>> + if relpath:
>> + objs.append(relpath)
>=20
> The above block of code needs a comment. What exactly is it doing ?
> My quick read of it makes me think it is checking our staged / rootfs /
> sysroot
> for the modules, and then removing that part of the path so we'll
> presumably
> have the path as they will appear on the target when it boots ?
>=20
> We need explanations in the code about the logic, otherwise, it is going
> to be unmaintainable.

Will add a comment.

>=20
>=20
>> +
>> + for o in sorted(objs):
>> + import re, stat
>> + if False:
>> + m =3D re.match(file_regex, o)
>> + else:
>> + m =3D re.match(file_regex, os.path.basename(o))
>> +
>> + if not m:
>> + continue
>=20
> Why isn't this test just done when walking the module files ? I don't
> see the point in walking once, and not testing to see if they are
> modules during that walk.

Probably, I had planned to optimize it later and then missed it. will revis=
e this.

>=20
>=20
>> +
>> + file =3D os.path.join(dvar + root, o)
>> + mode =3D os.lstat(file).st_mode
>> + if not (stat.S_ISREG(mode) or (allow_links and stat.S_ISLNK(mode)) or
>> (allow_dirs and stat.S_ISDIR(mode))):
>> + continue
>> +
>> + on =3D legitimize_package_name(m.group(1))
>> + pkg =3D output_pattern % on
>> +
>> + basename =3D m.group(1)
>> + handle_conf_files(d, basename, pkg)
>> +
>> + def frob_metadata(file, pkg, pattern, format, basename):
>> + vals =3D extract_modinfo(file)
>> + dvar =3D d.getVar('PKGD')
>> +
>> + handle_conf_files(d, basename, pkg)
>> +
>> if "description" in vals:
>> old_desc =3D d.getVar('DESCRIPTION:' + pkg) or ""
>> d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["description"])
>> @@ -167,19 +220,19 @@ python split_kernel_module_packages () {
>> postinst =3D d.getVar('pkg_postinst:modules')
>> postrm =3D d.getVar('pkg_postrm:modules')
>>=20
>> + module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
>> + module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>> + module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>> + module_pattern =3D module_pattern_prefix + kernel_package_name +
>> '-module-%s' + module_pattern_suffix
>> +
>> if splitmods !=3D '1':
>> d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %
>> (d.getVar('modulesloaddir'), d.getVar('modprobedir'),
>> d.getVar("nonarch_base_libdir")))
>> d.appendVar('pkg_postinst:%s' % metapkg, postinst)
>> - d.prependVar('pkg_postrm:%s' % metapkg, postrm);
>> + d.prependVar('pkg_postrm:%s' % metapkg, postrm)
>=20
> Why did you remove the semicolon above ? I admit it is strange to see
> it in the python routine, but it doesn't look related to your changes.

I thought the same way, I found it unusual in python and it did not have an=
 impact so I thought to follow the standard and do the cleanup.

>=20
>=20
>> + add_conf_files(d, root=3D'${nonarch_base_libdir}/modules',
>> file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern)
>=20
> I think this would be better called "create_conf_files" or
> "generate_conf_files".
>=20
> It was the semicolon and the name of the routine that had me asking about
> the
> routine being called from do_split_packages(). But I see that it in fact
> is
> not called during package splitting, but only called once (when splitting
> is
> not enabled) .. amd I ready that correctly now ?

Correct. Here there are two branches of execution based on whether the spli=
t is enabled or not. the execution reaches at do_split_package only in case=
 when split is enabled, otherwise, for split disabled case we will directly=
 call the conf file API.

Thanks,
Dixit

>=20
> Bruce
>=20
>=20
>> return
>>=20
>> - module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zst))?$'
>> -
>> - module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
>> - module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKAGE_SUFFIX')
>> - module_pattern =3D module_pattern_prefix + kernel_package_name +
>> '-module-%s' + module_pattern_suffix
>> -
>> modules =3D do_split_packages(d, root=3D'${nonarch_base_libdir}/modules'=
,
>> file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=
=3D'%s
>> kernel module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue,
>> hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (kernel_package_name,
>> kernel_version))
>> if modules:
>> d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
>> --
>> 2.43.0
>=20
>

--kVqKxxl6H49BsdakpNCS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Bruce, Thank you for your constructive feedback. Please find my inl=
ine replies.</div>
<div>FYI, I had submitted this v2 change before your comment on the previou=
s version, where you suggested to wait :| Thank you for considering this.</=
div>
<div>&nbsp;</div>
<div>On Fri, Mar 21, 2025 at 12:52 AM, Bruce Ashfield wrote:</div>
<div>
<blockquote>In message: [OE-core] [PATCH 1/1] kernel-module-split: fix conf=
 file generation when KERNEL_SPLIT_MODULES=3D0<br />on 16/03/2025 Dixit Par=
mar via lists.openembedded.org wrote:<br /><br />
<blockquote>When KERNEL_SPLIT_MODULES=3D0 modprobe and autoload conf files =
are not getting<br />generated for the kernel modules.<br /><br />Separated=
 out conf file handling mechanism as handle_conf_files() function<br />from=
 hook frob_metadata() function. handle_conf_files() gets re-used from the<b=
r />existing hook function and add_conf_files function which got introduced=
 for<br />splitmods=3D0 flow in this patch.</blockquote>
Trevor's advice on the commit message was excellent, I won't repeat<br />it=
 here. I'll just simply add that the commit message should give us<br />all=
 the information we need about the issue (and what its symptoms<br />are) a=
nd how this fixes it (not explaining the code, but describing<br />the stra=
tegy)</blockquote>
Understood. I will update the commit message with all these details.<br />
<blockquote>
<blockquote>[YOCTO #15145]<br /><br />Signed-off-by: Dixit Parmar &lt;dixit=
parmar19@gmail.com&gt;<br />Cc: George Thopas &lt;george.thopas@gmail.com&g=
t;<br />--<br />Can you show the conf files for the same kernel configurati=
on<br />with and without the kernel_split_modules enabled ? That way<br />w=
e know there's no change in existing behaviour.<br />
<blockquote>I have confirmed that in my testing. Can you suggest how I can<=
/blockquote>
share that information here?</blockquote>
A good way would simply to put it in the commit message that you've<br />bu=
ilt and booted with both modes and that the generated module<br />conf file=
s are the same in both cases. Showing a diff command<br />that you ran, or =
how you determined they were the same would be enough<br />as well.</blockq=
uote>
</div>
<div>Agreed.<br />
<blockquote>
<blockquote>We also should make a test for this in the OE selftests. We<br =
/>are adding conditional code paths, so they should be tested<br />to ensur=
e no regressions in either in the future.<br />
<blockquote>Never done that before. May be I can do it given some direction=
</blockquote>
as separate patch.</blockquote>
Any selftests should be in a separate patch, but they do need<br />to come =
along with any new verions of this. Saying that "it will<br />be send later=
" won't get the patches merged. Since everyone gets<br />busy and these sor=
ts of things tend to not happen.<br /><br />If you search on the mailing li=
st(s) you'll find examples of<br />other self tests being submitted. Just f=
ollow what they are<br />doing. I'd suggest that a self test needs to run b=
oth modes<br />and do a check that the generated .conf files are correct<br=
 />(basically what you'd be showing in the commit message). Even<br />bette=
r if a boot and showing that they are (auto)loaded.<br /><br />That's the o=
nly way we can be sure this won't break in the<br />future and be comfortab=
le with the complexty being added.</blockquote>
</div>
<div>Agree. I will look at the self-test implementations and develop the te=
st for this too.<br />
<blockquote>
<blockquote>I'm curious about the above line. It is unclear to me why we'd<=
br />only have this postinst be relevant if none was previously set.<br />
<blockquote>Reverted.</blockquote>
Is there really a scenario where the directory won't exist ? Isn't<br />thi=
s just running in our own install phase ? So all prerequisites<br />and dir=
ectories should be in place.<br />
<blockquote>Ideally no, we kept it for safer side, I have added log warning=
.</blockquote>
</blockquote>
As Trevor mentioned in his reply, it is best to configure your<br />mail cl=
ient to reply inline. I had made that comment near the<br />line of code in=
 question, but with the time between my review,<br />your reply and now thi=
s reply .. the context of what was being<br />discussed is very difficult t=
o remember.<br /><br />If that directory doesn't exist, just error out and =
do not<br />continue. This isn't something recoverable, and the build shoul=
d<br />be stopped.</blockquote>
Okay. Will handle it that way.<br />
<blockquote>
<blockquote>The walking and sorting seems quite heavy. Isn't this called fr=
om do_split_packages indirectly ?<br />Do we really need to walk and gather=
 the information ? Is this mainly for the case of no-split<br />on the kern=
el modules ? If that is the case, isn't there a way to short circuit the pr=
ocessing<br />on the split-package case ?<br />
<blockquote>Litterally I could not think of anything else here and not sure=
 of there</blockquote>
are any short-circuit options. I have limited knowledge in this. I am open =
to suggestions<br />if this is not the best solution at the moment.</blockq=
uote>
Describe the approach in your commit message, this is the type of<br />info=
rmation that we need. To be sure that it isn't adding a lot of<br />time to=
 the build, add some timing information with and without<br />your changes.=
 This is the type of information we are looking for<br />in a review.</bloc=
kquote>
Understood.<br />
<blockquote>See a few more comments below.<br /><br />
<blockquote>---<br />.../kernel-module-split.bbclass | 81 +++++++++++++++--=
--<br />1 file changed, 67 insertions(+), 14 deletions(-)<br /><br />diff -=
-git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recip=
e/kernel-module-split.bbclass<br />index 9487365eb7..b7ee3a8f9e 100644<br /=
>--- a/meta/classes-recipe/kernel-module-split.bbclass<br />+++ b/meta/clas=
ses-recipe/kernel-module-split.bbclass<br />@@ -86,11 +86,7 @@ python split=
_kernel_module_packages () {<br />vals[m.group(1)] =3D m.group(2)<br />retu=
rn vals<br /><br />- def frob_metadata(file, pkg, pattern, format, basename=
):<br />- vals =3D extract_modinfo(file)<br />-<br />- dvar =3D d.getVar('P=
KGD')<br />-<br />+ def handle_conf_files(d, basename, pkg):<br /># If auto=
loading is requested, output ${modulesloaddir}/&lt;name&gt;.conf and append=
<br /># appropriate modprobe commands to the postinst<br />autoloadlist =3D=
 (d.getVar("KERNEL_MODULE_AUTOLOAD") or "").split()<br />@@ -101,7 +97,7 @@=
 python split_kernel_module_packages () {<br />bb.warn("module_autoload_%s =
is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it=
 there" % (basename, basename))<br />if basename in autoloadlist:<br />conf=
 =3D '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)<br />- name =3D =
'%s%s' % (dvar, conf)<br />+ name =3D '%s%s' % (d.getVar('PKGD'), conf)<br =
/>os.makedirs(os.path.dirname(name), exist_ok=3DTrue)<br />with open(name, =
'w') as f:<br />if autoload:<br />@@ -123,7 +119,7 @@ python split_kernel_m=
odule_packages () {<br />modconf =3D d.getVar('module_conf_%s' % basename)<=
br />if modconf and basename in modconflist:<br />conf =3D '%s/%s.conf' % (=
d.getVar('modprobedir'), basename)<br />- name =3D '%s%s' % (dvar, conf)<br=
 />+ name =3D '%s%s' % (d.getVar('PKGD'), conf)<br />os.makedirs(os.path.di=
rname(name), exist_ok=3DTrue)<br />with open(name, 'w') as f:<br />f.write(=
"%s\n" % modconf)<br />@@ -134,6 +130,63 @@ python split_kernel_module_pack=
ages () {<br />elif modconf:<br />bb.error("Please ensure module %s is list=
ed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, bas=
ename))<br /><br />+ def add_conf_files(d, root, file_regex, output_pattern=
):<br />+ """<br />+ Arguments:<br />+ root -- the path in which to search<=
br />+ file_regex -- regular expression to match searched files. Use<br />+=
 parentheses () to mark the part of this expression<br />+ that should be u=
sed to derive the module name (to be<br />+ substituted where %s is used in=
 other function<br />+ arguments as noted below)<br />+ output_pattern -- p=
attern to use for the package names. Must include %s.<br />+ """<br />+<br =
/>+ dvar =3D d.getVar('PKGD')<br />+ root =3D d.expand(root)</blockquote>
root is a passed parameter, you shouldn't need to call d.expand()<br />on i=
t. Are you expecting there to be something that can be expanded ?</blockquo=
te>
</div>
<div>
<blockquote>
<blockquote>+ output_pattern =3D d.expand(output_pattern)</blockquote>
Likewise with output_pattern</blockquote>
Correct. It's not needed as I don't expect it to be expanded. I missed it.<=
br />
<blockquote>
<blockquote>+<br />+ # check if the root directory doesn't exist for safe s=
ide, don't error out later but silently do<br />+ # no splitting.<br />+ if=
 not os.path.exists(dvar + root):<br />+ bb.warn("kernel module root direct=
ory path does not exist")<br />+ return []</blockquote>
as I mentioned above, I see this as a fatal error. Something has gone<br />=
terribly wrong if this doesn't exist and we should error and exit.<br /><br=
 />
<blockquote>+<br />+ # get list of modules<br />+ objs =3D []<br />+ for wa=
lkroot, dirs, files in os.walk(dvar + root):<br />+ for file in files:<br /=
>+ relpath =3D os.path.join(walkroot, file).replace(dvar + root + '/', '', =
1)<br />+ if relpath:<br />+ objs.append(relpath)</blockquote>
The above block of code needs a comment. What exactly is it doing ?<br />My=
 quick read of it makes me think it is checking our staged / rootfs / sysro=
ot<br />for the modules, and then removing that part of the path so we'll p=
resumably<br />have the path as they will appear on the target when it boot=
s ?<br /><br />We need explanations in the code about the logic, otherwise,=
 it is going<br />to be unmaintainable.</blockquote>
Will add a comment.<br />
<blockquote>
<blockquote>+<br />+ for o in sorted(objs):<br />+ import re, stat<br />+ i=
f False:<br />+ m =3D re.match(file_regex, o)<br />+ else:<br />+ m =3D re.=
match(file_regex, os.path.basename(o))<br />+<br />+ if not m:<br />+ conti=
nue</blockquote>
Why isn't this test just done when walking the module files ? I don't<br />=
see the point in walking once, and not testing to see if they are<br />modu=
les during that walk.</blockquote>
Probably, I had planned to optimize it later and then missed it. will revis=
e this.<br />
<blockquote>
<blockquote>+<br />+ file =3D os.path.join(dvar + root, o)<br />+ mode =3D =
os.lstat(file).st_mode<br />+ if not (stat.S_ISREG(mode) or (allow_links an=
d stat.S_ISLNK(mode)) or (allow_dirs and stat.S_ISDIR(mode))):<br />+ conti=
nue<br />+<br />+ on =3D legitimize_package_name(m.group(1))<br />+ pkg =3D=
 output_pattern % on<br />+<br />+ basename =3D m.group(1)<br />+ handle_co=
nf_files(d, basename, pkg)<br />+<br />+ def frob_metadata(file, pkg, patte=
rn, format, basename):<br />+ vals =3D extract_modinfo(file)<br />+ dvar =
=3D d.getVar('PKGD')<br />+<br />+ handle_conf_files(d, basename, pkg)<br /=
>+<br />if "description" in vals:<br />old_desc =3D d.getVar('DESCRIPTION:'=
 + pkg) or ""<br />d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["d=
escription"])<br />@@ -167,19 +220,19 @@ python split_kernel_module_package=
s () {<br />postinst =3D d.getVar('pkg_postinst:modules')<br />postrm =3D d=
.getVar('pkg_postrm:modules')<br /><br />+ module_regex =3D r'^(.*)\.k?o(?:=
\.(gz|xz|zst))?$'<br />+ module_pattern_prefix =3D d.getVar('KERNEL_MODULE_=
PACKAGE_PREFIX')<br />+ module_pattern_suffix =3D d.getVar('KERNEL_MODULE_P=
ACKAGE_SUFFIX')<br />+ module_pattern =3D module_pattern_prefix + kernel_pa=
ckage_name + '-module-%s' + module_pattern_suffix<br />+<br />if splitmods =
!=3D '1':<br />d.appendVar('FILES:' + metapkg, '%s %s %s/modules' %<br />(d=
.getVar('modulesloaddir'), d.getVar('modprobedir'), d.getVar("nonarch_base_=
libdir")))<br />d.appendVar('pkg_postinst:%s' % metapkg, postinst)<br />- d=
.prependVar('pkg_postrm:%s' % metapkg, postrm);<br />+ d.prependVar('pkg_po=
strm:%s' % metapkg, postrm)</blockquote>
Why did you remove the semicolon above ? I admit it is strange to see<br />=
it in the python routine, but it doesn't look related to your changes.</blo=
ckquote>
I thought the same way, I found it unusual in python and it did not have an=
 impact so I thought to follow the standard and do the cleanup.<br />
<blockquote>
<blockquote>+ add_conf_files(d, root=3D'${nonarch_base_libdir}/modules', fi=
le_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern)</blockquote>
I think this would be better called "create_conf_files" or "generate_conf_f=
iles".<br /><br />It was the semicolon and the name of the routine that had=
 me asking about the<br />routine being called from do_split_packages(). Bu=
t I see that it in fact is<br />not called during package splitting, but on=
ly called once (when splitting is<br />not enabled) .. amd I ready that cor=
rectly now ?</blockquote>
Correct. Here there are two branches of execution based on whether the spli=
t is enabled or not. the execution reaches at do_split_package only in case=
 when split is enabled, otherwise, for split disabled case we will directly=
 call the conf file API.</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Dixit<br />
<blockquote>Bruce<br /><br />
<blockquote>return<br /><br />- module_regex =3D r'^(.*)\.k?o(?:\.(gz|xz|zs=
t))?$'<br />-<br />- module_pattern_prefix =3D d.getVar('KERNEL_MODULE_PACK=
AGE_PREFIX')<br />- module_pattern_suffix =3D d.getVar('KERNEL_MODULE_PACKA=
GE_SUFFIX')<br />- module_pattern =3D module_pattern_prefix + kernel_packag=
e_name + '-module-%s' + module_pattern_suffix<br />-<br />modules =3D do_sp=
lit_packages(d, root=3D'${nonarch_base_libdir}/modules', file_regex=3Dmodul=
e_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel module',=
 postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metada=
ta, extra_depends=3D'%s-%s' % (kernel_package_name, kernel_version))<br />i=
f modules:<br />d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))<b=
r />-- <br />2.43.0</blockquote>
</blockquote>
</div>

--kVqKxxl6H49BsdakpNCS--

