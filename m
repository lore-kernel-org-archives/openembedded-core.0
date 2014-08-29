Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0D02960E49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 22:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TM2t32021873; Fri, 29 Aug 2014 23:02:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id emz658B9VKFx; Fri, 29 Aug 2014 23:02:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TM2rGJ021869
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 23:02:54 +0100
Message-ID: <1409349774.29296.208.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 29 Aug 2014 23:02:54 +0100
In-Reply-To: <5400C83C.3020306@windriver.com>
References: <1409333952.29296.195.camel@ted> <5400C83C.3020306@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm: Add optional improved directory handling
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
X-List-Received-Date: Fri, 29 Aug 2014 22:02:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-29 at 13:36 -0500, Mark Hatle wrote:
> On 8/29/14, 12:39 PM, Richard Purdie wrote:
> > From: Ronan Le Martret <ronan@fridu.net>
> >
> > During spec generation, ideally directories should not be auto
> > packaged under the %file section of rpm packages but take ownership of
> > specific directories.
> >
> > * packages only empty directories or explict directory.
> >     See:
> >         - http://www.rpm.org/max-rpm/s1-rpm-inside-files-list-directives.html
> >         - "The %dir Directive"
> >
> > * This will prevent the overlapping of security permission.
> >     For example, in Tizen the directory /etc have smack label 'System::Shared'
> >     So Only one package should own and set the label of /etc to prevent
> >     the overwriting of the smack label.
> >
> > Existing behaviour is maintained if DIRFILES is not set. If it is set,
> > the modified behaviour is used.
> >
> > [RP: Modified to allow optional usage of DIRFILES]
> 
> I'm not sure I understand what is trying to be accomplished here.
> 
> Within RPM (4 and 5) it's completely legal for two packages to contain the same 
> directory and permissions entries.  This is preferable for our environment as it 
> allows the necessary directories to be generated as packages are installed that 
> use these directories.  (Otherwise we have to have "directory" packages that 
> install common directories -- or base packages that own directories for a group 
> of packages.)
> 
> I think it's a bug in the SMACK labeling that it doesn't support packages having 
> multiple directory support.

Whether we agree with it or not, this is something we're being asked
about...

> With that said see below..
> 
> > Signed-off-by: Ronan Le Martret <ronan@fridu.net>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> > index 0a32b3e..eecfcb2 100644
> > --- a/meta/classes/package_rpm.bbclass
> > +++ b/meta/classes/package_rpm.bbclass
> > @@ -185,7 +185,7 @@ python write_specfile () {
> >                   if not len(depends_dict[dep]):
> >                       array.append("%s: %s" % (tag, dep))
> >
> > -    def walk_files(walkpath, target, conffiles):
> > +    def walk_files(walkpath, target, conffiles, dirfiles):
> >           # We can race against the ipk/deb backends which create CONTROL or DEBIAN directories
> >           # when packaging. We just ignore these files which are created in
> >           # packages-split/ and not package/
> > @@ -196,11 +196,24 @@ python write_specfile () {
> >               path = rootpath.replace(walkpath, "")
> >               if path.endswith("DEBIAN") or path.endswith("CONTROL"):
> >                   continue
> > -            for dir in dirs:
> > -                if dir == "CONTROL" or dir == "DEBIAN":
> > -                    continue
> > -                # All packages own the directories their files are in...
> > -                target.append('%dir "' + path + '/' + dir + '"')
> > +
> > +            # Directory handling can happen in two ways, either DIRFILES is not set at all
> > +            # in which case we fall back to the older behaviour of packages owning all their
> > +            # directories
> > +            if dirfiles is None:
> 
> So if dirfiles is none (the normal case) it -will- package directories, correct? 
>   So what happens when you have a recipe that you don't want to package any 
> directories?

If DIRFILES is not set, you get the current behaviour, importantly, this
means existing code continues to work as is. My biggest concern with
some other proposals out there is that they need a flag day complete
with breakage :/.

> Having to define dirfiles seems to be backwards to me.  A blacklist behavior 
> seems more sane, as a way to say "I use this, but I don't own it."

This is the explicit verses implicit argument. With implicit the risk is
things change and you don't notice so there is an argument for this
working the other way for that reason. I have to admit I don't have a
strong preference, I do know we have people already using it as defined
by the code above though.

> Along those lines (blacklist vs include list), the system directories should 
> already be defined in the meta/files/fs-perms.txt (or related perms files 
> configured by "FILESYSTEM_PERMS_TABLES".
> 
> The purpose is to capture system directories that are shared between different 
> recipes to ensure they have the same permissions.
> 
> It should be possible to (safely) extend this to include additional common 
> permissions [might violate SMACK security] or directories that should not be 
> packaged because they are 'system' directories.
> 
> (Note in the later case, we definitely need at least one 'directory owner' 
> package to handle those -- or they will be generated on demand with default 
> system permissions of 0755 root,root  -- which is not always what is desired!)

Going back in time, I remember us specifically talking about directory
ownership and how we likely should try and reach a point where the
common system directories do become owned by specific packages. With
this kind of DIRFILES support we could move in the direction. The perms
tables obviously help to a point ensuring consistent permissions but
they don't help the ownership problem. Or is this less of an issue since
we last discussed it (which admittedly was a while ago)?


> > +                for dir in dirs:
> > +                    if dir == "CONTROL" or dir == "DEBIAN":
> > +                        continue
> > +                    # All packages own the directories their files are in...
> > +                    target.append('%dir "' + path + '/' + dir + '"')
> > +            else:
> > +                # packages own only empty directories or explict directory.
> > +                # This will prevent the overlapping of security permission.
> > +                if path and not files and not dirs:
> > +                    target.append('%dir "' + path + '"')
> > +                elif path and path in dirfiles:
> > +                    target.append('%dir "' + path + '"')
> > +
> >               for file in files:
> >                   if file == "CONTROL" or file == "DEBIAN":
> >                       continue
> > @@ -311,6 +324,9 @@ python write_specfile () {
> >           bb.data.update_data(localdata)
> >
> >           conffiles = (localdata.getVar('CONFFILES', True) or "").split()
> > +        dirfiles = localdata.getVar('DIRFILES', True)
> > +        if dirfiles is not None:
> > +            dirfiles = dirfiles.split()
> 
> (tabs and spaces mismatch? or just a mailer issue mangling spacing?)

I probably mangled the patch somehow, will check...

Cheers,

Richard


