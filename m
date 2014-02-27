Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B1AFC6E74C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:35:58 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 27 Feb 2014 15:35:55 +0100
Message-ID: <530F4D46.1060401@enea.com>
Date: Thu, 27 Feb 2014 15:35:50 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>
	<20140227142404.GB3534@lpalcu-linux>
In-Reply-To: <20140227142404.GB3534@lpalcu-linux>
X-Originating-IP: [172.16.141.133]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Thu, 27 Feb 2014 14:36:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-27 15:24, Laurentiu Palcu wrote:
> Hi David,
>
> My comments/questions below.

Thank you for your detailed comments on the RFC.
I will return with V2, where your comments are addressed when the=20
general approach is Acked.

What do you think about the general approach ?
I guess it was you who added the insert_feeds_uris stubs in rootfs.py ?

Br,
David

> laurentiu
>
> On Thu, Feb 27, 2014 at 02:28:21PM +0100, David Nystr=F6m wrote:
>> local.conf defines
>> PACKAGE_FEED_URIS =3D "http://www.feed_repo.org/repo/"
>>
>> should we do it this way or some other way ?
>>
>> [Bug 5407]
>>
>>
>>
>> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
>> ---
>>   meta/lib/oe/package_manager.py | 76 ++++++++++++++++++++++++++++++++++=
+++++++-
>>   meta/lib/oe/rootfs.py          | 15 +++++++--
>>   2 files changed, 87 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manage=
r.py
>> index d29adac..d4050c6 100644
>> --- a/meta/lib/oe/package_manager.py
>> +++ b/meta/lib/oe/package_manager.py
>> @@ -223,6 +223,7 @@ class PackageManager(object):
>>           self.d =3D d
>>           self.deploy_dir =3D None
>>           self.deploy_lock =3D None
>> +        self.feed_uris =3D None
> I guess you can do:
>             self.feed_uris =3D self.d.getVar('PACKAGE_FEED_URIS', True) o=
r ""
> since we're using the same variable for all backends.
>
>>
>>       """
>>       Update the package manager package database.
>> @@ -262,6 +263,10 @@ class PackageManager(object):
>>       def list_installed(self, format=3DNone):
>>           pass
>>
>> +    @abstractmethod
>> +    def insert_feeds_uris(self):
>> +        pass
>> +
>>       """
>>       Install complementary packages based upon the list of currently in=
stalled
>>       packages e.g. locales, *-dev, *-dbg, etc. This will only attempt t=
o install
>> @@ -339,6 +344,7 @@ class RpmPM(PackageManager):
>>           self.providename =3D providename
>>           self.fullpkglist =3D list()
>>           self.deploy_dir =3D self.d.getVar('DEPLOY_DIR_RPM', True)
>> +        self.feed_uris =3D self.d.getVar('PACKAGE_FEED_URIS', True)
> can be removed, see above.
>
>>           self.etcrpm_dir =3D os.path.join(self.target_rootfs, "etc/rpm"=
)
>>           self.install_dir =3D os.path.join(self.target_rootfs, "install=
")
>>           self.rpm_cmd =3D bb.utils.which(os.getenv('PATH'), "rpm")
>> @@ -358,6 +364,41 @@ class RpmPM(PackageManager):
>>
>>           self.ml_prefix_list, self.ml_os_list =3D self.indexer.get_ml_p=
refix_and_os_list(arch_var, os_var)
>>
>> +
>> +    def insert_feeds_uris(self):
> shouldn't we check that self.feed_uris !=3D "" before continuing?
>
>> +        # List must be prefered to least preferred order
>> +        channel_priority =3D 5
>> +        default_platform_extra =3D set()
>> +        platform_extra =3D set()
>> +        bbextendvariant =3D self.d.getVar('BBEXTENDVARIANT', True) or "=
"
>> +        for mlib in self.ml_os_list:
>> +            for arch in self.ml_prefix_list[mlib]:
>> +                plt =3D arch.replace('-', '_') + '-.*-' + self.ml_os_li=
st[mlib]
>> +                if mlib =3D=3D bbextendvariant:
>> +                        default_platform_extra.add(plt)
>> +                else:
>> +                        platform_extra.add(plt)
>> +                channel_priority +=3D 5
>> +
>> +        platform_extra =3D platform_extra.union(default_platform_extra)
>> +
>> +        for uri in self.feed_uris.split():
>> +            channel_priority *=3D 2
>> +            uri_iterator =3D 0
>> +            for canonical_arch in platform_extra:
>> +                arch =3D canonical_arch.split('-')[0]
>> +                if arch =3D=3D "noarch" or arch =3D=3D "any":
>> +                    continue
>> +
>> +                bb.note('Note: adding Smart channel url%d%s (%s)' %
>> +                        (uri_iterator, arch, channel_priority))
>> +                self._invoke_smart('channel --add url%d-%s type=3Drpm-m=
d baseurl=3D%s/rpm/%s -y'
>> +                                   % (uri_iterator, arch, uri, arch))
>> +                self._invoke_smart('channel --set url%d-%s priority=3D%=
d' %
>> +                                   (uri_iterator, arch, channel_priorit=
y))
>> +                channel_priority -=3D 5
>> +            uri_iterator +=3D 1
>> +
>>       '''
>>       Create configs for rpm and smart, and multilib is supported
>>       '''
>> @@ -944,7 +985,7 @@ class OpkgPM(PackageManager):
>>
>>           self.deploy_dir =3D self.d.getVar("DEPLOY_DIR_IPK", True)
>>           self.deploy_lock_file =3D os.path.join(self.deploy_dir, "deplo=
y.lock")
>> -
>> +        self.feed_uris =3D self.d.getVar('PACKAGE_FEED_URIS', True)
> can be removed, see above.
>
>>           self.opkg_cmd =3D bb.utils.which(os.getenv('PATH'), "opkg-cl")
>>           self.opkg_args =3D "-f %s -o %s " % (self.config_file, target_=
rootfs)
>>           self.opkg_args +=3D self.d.getVar("OPKG_ARGS", True)
>> @@ -1050,6 +1091,24 @@ class OpkgPM(PackageManager):
>>                       config_file.write("src oe-%s file:%s\n" %
>>                                         (arch, pkgs_dir))
>>
>> +    def insert_feeds_uris(self):
> check self.feed_uris !=3D "" here?
>> +        rootfs_config =3D os.path.join('%s/etc/opkg/base-feeds.conf'
>> +                                  % self.target_rootfs)
>> +
>> +        with open(rootfs_config, "w+") as config_file:
>> +            priority =3D 5
> apparently this is not used at all in the code below, can be removed.
>
>> +            uri_iterator =3D 0
>> +            for uri in self.feed_uris.split():
>> +                config_file.write("src/gz url-%d %s/ipk\n" %
>> +                                  (uri_iterator, uri))
>> +
>> +                for arch in self.pkg_archs.split():
>> +                    if arch =3D=3D "noarch" or arch =3D=3D "any":
>> +                        continue
>> +                    config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
>> +                                      (arch, uri_iterator, uri, arch))
>> +                uri_iterator +=3D 1
>> +
>>       def update(self):
>>           self.deploy_dir_lock()
>>
>> @@ -1250,6 +1309,7 @@ class DpkgPM(PackageManager):
>>       def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_d=
ir=3DNone):
>>           super(DpkgPM, self).__init__(d)
>>           self.target_rootfs =3D target_rootfs
>> +        self.feed_uris =3D self.d.getVar('PACKAGE_FEED_URIS', True)
> can be removed, see above.
>
>>           self.deploy_dir =3D self.d.getVar('DEPLOY_DIR_DEB', True)
>>           if apt_conf_dir is None:
>>               self.apt_conf_dir =3D self.d.expand("${APTCONF_TARGET}/apt=
")
>> @@ -1410,6 +1470,20 @@ class DpkgPM(PackageManager):
>>           if result is not None:
>>               bb.fatal(result)
>>
>> +    def insert_feeds_uris(self):
> check self.feed_uris !=3D "" here?
>
>> +        sources_conf =3D os.path.join("%s/etc/apt/sources.list"
>> +                                    % self.target_rootfs)
>> +        arch_list =3D []
>> +        archs =3D self.d.getVar('PACKAGE_ARCHS', True)
>> +        arch_list =3D archs.split()
>> +        with open(sources_conf, "w+") as sources_file:
>> +            for uri in self.feed_uris.split():
>> +                for arch in arch_list:
>> +                    if arch =3D=3D "noarch" or arch =3D=3D "any":
>> +                        continue
>> +                    sources_file.write("deb %s/deb/%s ./\n" %
>> +                                       (uri, arch))
>> +
>>       def _create_configs(self, archs, base_archs):
>>           base_archs =3D re.sub("_", "-", base_archs)
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index be0afa6..7be2a18 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -350,7 +350,10 @@ class RpmRootfs(Rootfs):
>>                       bb.fatal(message)
>>
>>       def _insert_feed_uris(self):
>> -        pass
>> +        if base_contains("IMAGE_FEATURES", "package-management",
>> +                         False, True, self.d):
>> +            return
>> +        self.pm.insert_feeds_uris()
> For the sake of code clarity, I would suggest:
>
>          if base_contains("IMAGE_FEATURES", "package-management",
>                           True, False, self.d):
>              self.pm.insert_feeds_uris()
>
>>
>>       def _handle_intercept_failure(self, registered_pkgs):
>>           rpm_postinsts_dir =3D self.image_rootfs + self.d.expand('${sys=
confdir}/rpm-postinsts/')
>> @@ -433,7 +436,10 @@ class DpkgRootfs(Rootfs):
>>           pass
>>
>>       def _insert_feed_uris(self):
>> -        pass
>> +        if base_contains("IMAGE_FEATURES", "package-management",
>> +                         False, True, self.d):
>> +            return
>> +        self.pm.insert_feeds_uris()
> same here.
>
>>
>>
>>   class OpkgRootfs(Rootfs):
>> @@ -699,8 +705,11 @@ class OpkgRootfs(Rootfs):
>>           pass
>>
>>       def _insert_feed_uris(self):
>> -        pass
>> +        if base_contains("IMAGE_FEATURES", "package-management",
>> +                         False, True, self.d):
>> +            return
>>
>> +        self.pm.insert_feeds_uris()
> same here.
>
>>
>>   def create_rootfs(d, manifest_dir=3DNone):
>>       env_bkp =3D os.environ.copy()
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


