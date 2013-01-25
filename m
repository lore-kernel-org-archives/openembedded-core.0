Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1TyjEl-0000aN-Vq
	for Openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 14:22:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0PD6vWX024926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 05:06:57 -0800 (PST)
Received: from [172.25.32.40] (172.25.32.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 25 Jan 2013 05:06:56 -0800
Message-ID: <5102836F.1020701@windriver.com>
Date: Fri, 25 Jan 2013 07:06:55 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <Openembedded-core@lists.openembedded.org>
References: <1359074326-12029-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1359074326-12029-1-git-send-email-jason.wessel@windriver.com>
X-Enigmail-Version: 1.5
Subject: Re: [PATCH 1/2] relocate_sdk.py: Fix corruption of sdk binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 13:22:36 -0000
X-Groupsio-MsgNum: 34425
Content-Type: multipart/mixed; boundary="------------080608040005020707000302"

--------------080608040005020707000302
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 01/24/2013 06:38 PM, Jason Wessel wrote:
> There are two cases of corruption that the relocate_sdk.py was not correctly
> dealing with.
>
> 1) SDK Extras should be left alone
>    Extra external binaries included in an SDK that were linked against the
>    host's version of /usr/lib/ld-so.so should not get a relocation applied.
>    In the case that was discovered these were LSB compliant binaries that
>    already worked on many hosts.
>
> 2) If the interp section is too small generate an error
>    In the case of the qemu user code, it was using its own .ld file
>    to link the executables which overrides the default in the nativesdk
>    binutils.  This generated host executables which had a interp section
>    that was too small to relocate.
>
>    Now the relocate_sdk.py will print an error and continue on such that
>    the error can be fixed by a developer without having to do the
>    difficult task of debugging why it is crashing or not loading correctly.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  scripts/relocate_sdk.py |   17 +++++++++++++----
>  1 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> index 74bb7a5..3e3181f 100755
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -66,7 +66,7 @@ def parse_elf_header():
>      e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx =\
>          hdr_struct.unpack(elf_header[16:hdr_size])
>  
> -def change_interpreter():
> +def change_interpreter(elf_file_name):
>      if arch == 32:
>          ph_struct = struct.Struct("<IIIIIIII")
>      else:
> @@ -89,8 +89,17 @@ def change_interpreter():
>          if p_type == 3:
>              # PT_INTERP section
>              f.seek(p_offset)
> -            dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
> -            f.write(dl_path)
> +            dl_path = new_dl_path + "\0"
> +            # External SDKs with mixed pre-compiled binaries should not get
> +            # relocated so look for some variant of /lib
> +            fname = f.read(11)
> +            if fname.startswith("/lib/") or fname.startswith("/lib64/") or fname.startswith("/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib32/") or fname.startswith("/usr/lib64/"):
> +                break
> +            if (len(dl_path) >= p_memsz):
> +                print "ERROR: could not relocate %s, interp size = %i and %i is needed." % (elf_file_name, p_memsz, len(dl_path))
> +                break
> +            f.seek(p_offset)
> +            f.write(dl_path )

oops...  Need a yocto check patch for python white space eh?


Attached is the fixed version.

Cheers,
Jason.

--------------080608040005020707000302
Content-Type: application/mbox;
	name="0001-relocate_sdk.py-Fix-corruption-of-sdk-binaries.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="0001-relocate_sdk.py-Fix-corruption-of-sdk-binaries.patch"

RnJvbSBmMDgzMGM3YjRjZmZiM2QzZGQ5NjhiM2NmN2Q2NjRmYTY0OWM2MmRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYXNvbiBXZXNzZWwgPGphc29uLndlc3NlbEB3aW5kcml2ZXIu
Y29tPgpEYXRlOiBUaHUsIDI0IEphbiAyMDEzIDExOjU4OjE5IC0wODAwClN1YmplY3Q6IFtQQVRD
SCAxLzJdIHJlbG9jYXRlX3Nkay5weTogRml4IGNvcnJ1cHRpb24gb2Ygc2RrIGJpbmFyaWVzCgpU
aGVyZSBhcmUgdHdvIGNhc2VzIG9mIGNvcnJ1cHRpb24gdGhhdCB0aGUgcmVsb2NhdGVfc2RrLnB5
IHdhcyBub3QgY29ycmVjdGx5CmRlYWxpbmcgd2l0aC4KCjEpIFNESyBFeHRyYXMgc2hvdWxkIGJl
IGxlZnQgYWxvbmUKICAgRXh0cmEgZXh0ZXJuYWwgYmluYXJpZXMgaW5jbHVkZWQgaW4gYW4gU0RL
IHRoYXQgd2VyZSBsaW5rZWQgYWdhaW5zdCB0aGUKICAgaG9zdCdzIHZlcnNpb24gb2YgL3Vzci9s
aWIvbGQtc28uc28gc2hvdWxkIG5vdCBnZXQgYSByZWxvY2F0aW9uIGFwcGxpZWQuCiAgIEluIHRo
ZSBjYXNlIHRoYXQgd2FzIGRpc2NvdmVyZWQgdGhlc2Ugd2VyZSBMU0IgY29tcGxpYW50IGJpbmFy
aWVzIHRoYXQKICAgYWxyZWFkeSB3b3JrZWQgb24gbWFueSBob3N0cy4KCjIpIElmIHRoZSBpbnRl
cnAgc2VjdGlvbiBpcyB0b28gc21hbGwgZ2VuZXJhdGUgYW4gZXJyb3IKICAgSW4gdGhlIGNhc2Ug
b2YgdGhlIHFlbXUgdXNlciBjb2RlLCBpdCB3YXMgdXNpbmcgaXRzIG93biAubGQgZmlsZQogICB0
byBsaW5rIHRoZSBleGVjdXRhYmxlcyB3aGljaCBvdmVycmlkZXMgdGhlIGRlZmF1bHQgaW4gdGhl
IG5hdGl2ZXNkawogICBiaW51dGlscy4gIFRoaXMgZ2VuZXJhdGVkIGhvc3QgZXhlY3V0YWJsZXMg
d2hpY2ggaGFkIGEgaW50ZXJwIHNlY3Rpb24KICAgdGhhdCB3YXMgdG9vIHNtYWxsIHRvIHJlbG9j
YXRlLgoKICAgTm93IHRoZSByZWxvY2F0ZV9zZGsucHkgd2lsbCBwcmludCBhbiBlcnJvciBhbmQg
Y29udGludWUgb24gc3VjaCB0aGF0CiAgIHRoZSBlcnJvciBjYW4gYmUgZml4ZWQgYnkgYSBkZXZl
bG9wZXIgd2l0aG91dCBoYXZpbmcgdG8gZG8gdGhlCiAgIGRpZmZpY3VsdCB0YXNrIG9mIGRlYnVn
Z2luZyB3aHkgaXQgaXMgY3Jhc2hpbmcgb3Igbm90IGxvYWRpbmcgY29ycmVjdGx5LgoKU2lnbmVk
LW9mZi1ieTogSmFzb24gV2Vzc2VsIDxqYXNvbi53ZXNzZWxAd2luZHJpdmVyLmNvbT4KLS0tCiBz
Y3JpcHRzL3JlbG9jYXRlX3Nkay5weSB8ICAgMTUgKysrKysrKysrKysrLS0tCiAxIGZpbGVzIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9yZWxvY2F0ZV9zZGsucHkgYi9zY3JpcHRzL3JlbG9jYXRlX3Nkay5weQppbmRleCA3NGJi
N2E1Li42ZjM1MzBkIDEwMDc1NQotLS0gYS9zY3JpcHRzL3JlbG9jYXRlX3Nkay5weQorKysgYi9z
Y3JpcHRzL3JlbG9jYXRlX3Nkay5weQpAQCAtNjYsNyArNjYsNyBAQCBkZWYgcGFyc2VfZWxmX2hl
YWRlcigpOgogICAgIGVfZWhzaXplLCBlX3BoZW50c2l6ZSwgZV9waG51bSwgZV9zaGVudHNpemUs
IGVfc2hudW0sIGVfc2hzdHJuZHggPVwKICAgICAgICAgaGRyX3N0cnVjdC51bnBhY2soZWxmX2hl
YWRlclsxNjpoZHJfc2l6ZV0pCiAKLWRlZiBjaGFuZ2VfaW50ZXJwcmV0ZXIoKToKK2RlZiBjaGFu
Z2VfaW50ZXJwcmV0ZXIoZWxmX2ZpbGVfbmFtZSk6CiAgICAgaWYgYXJjaCA9PSAzMjoKICAgICAg
ICAgcGhfc3RydWN0ID0gc3RydWN0LlN0cnVjdCgiPElJSUlJSUlJIikKICAgICBlbHNlOgpAQCAt
ODksNyArODksMTYgQEAgZGVmIGNoYW5nZV9pbnRlcnByZXRlcigpOgogICAgICAgICBpZiBwX3R5
cGUgPT0gMzoKICAgICAgICAgICAgICMgUFRfSU5URVJQIHNlY3Rpb24KICAgICAgICAgICAgIGYu
c2VlayhwX29mZnNldCkKLSAgICAgICAgICAgIGRsX3BhdGggPSBuZXdfZGxfcGF0aCArICJcMCIg
KiAocF9maWxlc3ogLSBsZW4obmV3X2RsX3BhdGgpKQorICAgICAgICAgICAgZGxfcGF0aCA9IG5l
d19kbF9wYXRoICsgIlwwIgorICAgICAgICAgICAgIyBFeHRlcm5hbCBTREtzIHdpdGggbWl4ZWQg
cHJlLWNvbXBpbGVkIGJpbmFyaWVzIHNob3VsZCBub3QgZ2V0CisgICAgICAgICAgICAjIHJlbG9j
YXRlZCBzbyBsb29rIGZvciBzb21lIHZhcmlhbnQgb2YgL2xpYgorICAgICAgICAgICAgZm5hbWUg
PSBmLnJlYWQoMTEpCisgICAgICAgICAgICBpZiBmbmFtZS5zdGFydHN3aXRoKCIvbGliLyIpIG9y
IGZuYW1lLnN0YXJ0c3dpdGgoIi9saWI2NC8iKSBvciBmbmFtZS5zdGFydHN3aXRoKCIvbGliMzIv
Iikgb3IgZm5hbWUuc3RhcnRzd2l0aCgiL3Vzci9saWIzMi8iKSBvciBmbmFtZS5zdGFydHN3aXRo
KCIvdXNyL2xpYjMyLyIpIG9yIGZuYW1lLnN0YXJ0c3dpdGgoIi91c3IvbGliNjQvIik6CisgICAg
ICAgICAgICAgICAgYnJlYWsKKyAgICAgICAgICAgIGlmIChsZW4oZGxfcGF0aCkgPj0gcF9tZW1z
eik6CisgICAgICAgICAgICAgICAgcHJpbnQgIkVSUk9SOiBjb3VsZCBub3QgcmVsb2NhdGUgJXMs
IGludGVycCBzaXplID0gJWkgYW5kICVpIGlzIG5lZWRlZC4iICUgKGVsZl9maWxlX25hbWUsIHBf
bWVtc3osIGxlbihkbF9wYXRoKSkKKyAgICAgICAgICAgICAgICBicmVhaworICAgICAgICAgICAg
Zi5zZWVrKHBfb2Zmc2V0KQogICAgICAgICAgICAgZi53cml0ZShkbF9wYXRoKQogICAgICAgICAg
ICAgYnJlYWsKIApAQCAtMTk5LDcgKzIwOCw3IEBAIGZvciBlIGluIGV4ZWN1dGFibGVzX2xpc3Q6
CiAgICAgYXJjaCA9IGdldF9hcmNoKCkKICAgICBpZiBhcmNoOgogICAgICAgICBwYXJzZV9lbGZf
aGVhZGVyKCkKLSAgICAgICAgY2hhbmdlX2ludGVycHJldGVyKCkKKyAgICAgICAgY2hhbmdlX2lu
dGVycHJldGVyKGUpCiAgICAgICAgIGNoYW5nZV9kbF9zeXNkaXJzKCkKIAogICAgICIiIiBjaGFu
Z2UgcGVybWlzc2lvbnMgYmFjayAiIiIKLS0gCjEuNy4xCgo=

--------------080608040005020707000302--
