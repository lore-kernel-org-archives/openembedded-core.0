Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id F358A60190
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Sep 2016 14:48:02 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=HTFFnc8vORAq/z+wDtR6AM0VKT2rrWIoeK/nrRV20G9ecGAmbT+1OJg7eMa8PAE58Akf3MZJkM8X
	b96EZHHr/MlRzGOBjfPd2GbPvOAvbZieOY+1DgB48fKhMLCFw1eqE/hooOBcee9ni96lhSQXgeO8
	Zog50XxtjgEL1olVR+o=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1474728480072903.0506436716298;
	Sat, 24 Sep 2016 07:48:00 -0700 (PDT)
Date: Sat, 24 Sep 2016 10:48:00 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
In-Reply-To: <cover.1474562101.git.akuster808@gmail.com>
References: <cover.1474562101.git.akuster808@gmail.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/60] krogoth-next staged
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
X-List-Received-Date: Sat, 24 Sep 2016 14:48:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I think the systemd change may have broken something.  It looks like it is running a useradd with no arguments other than the root. Now I see the following error in krogoth:

from "tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/log.do_install"

DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common']
DEBUG: Executing shell function useradd_sysroot
Running groupadd commands...
NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified -r lock]
NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified  -r systemd-journal]
NOTE: systemd: group systemd-journal already exists, not re-creating it
Running useradd commands...
NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified     --system -d / -M --shell /bin/nologin systemd-timesync]
NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified    ]
Usage: useradd [options] LOGIN
       useradd -D
       useradd -D [options]

Options:
  -b, --base-dir BASE_DIR       base directory for the home directory of the
                                new account
  -c, --comment COMMENT         GECOS field of the new account
  -d, --home-dir HOME_DIR       home directory of the new account
  -D, --defaults                print or change default useradd configuration
  -e, --expiredate EXPIRE_DATE  expiration date of the new account
  -f, --inactive INACTIVE       password inactivity period of the new account
  -g, --gid GROUP               name or ID of the primary group of the new
                                account
  -G, --groups GROUPS           list of supplementary groups of the new
                                account
  -h, --help                    display this help message and exit
  -k, --skel SKEL_DIR           use this alternative skeleton directory
  -K, --key KEY=VALUE           override /etc/login.defs defaults
  -l, --no-log-init             do not add the user to the lastlog and
                                faillog databases
  -m, --create-home             create the user's home directory
  -M, --no-create-home          do not create the user's home directory
  -N, --no-user-group           do not create a group with the same name as
                                the user
  -o, --non-unique              allow to create users with duplicate
                                (non-unique) UID
  -p, --password PASSWORD       encrypted password of the new account
  -P, --clear-password PASSWORD clear password of the new account
  -r, --system                  create a system account
  -R, --root CHROOT_DIR         directory to chroot into
  -s, --shell SHELL             login shell of the new account
  -u, --uid UID                 user ID of the new account
  -U, --user-group              create a group with the same name as the user

WARNING: /mnt/bitbake/build/detos/tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/run.useradd_sysroot.31611:1 exit 1 from 'exit 1'
ERROR: systemd: useradd command did not succeed.



